﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ParishSystem
{
    public partial class BloodlettingEventPopUp : Form
    {
        int bloodlettingID;
        DataHandler dh;
        public BloodlettingEventPopUp(int bloodlettingID, DataHandler dh)
        {
            InitializeComponent();
            this.bloodlettingID = bloodlettingID;
            this.dh = dh;
        }

        public BloodlettingEventPopUp( DataHandler dh)
        {
            InitializeComponent();
            this.dh = dh;
            start_dateTimePicker.MinDate = DateTime.Now;
        }

        private void BloodlettingEventPopUp_Load(object sender, EventArgs e)
        {
            Draggable draggable = new Draggable(this);
            draggable.makeDraggable(controlBar_panel);
            refreshEvent();
           
    
        }

        private void edit_button_Click(object sender, EventArgs e)
        {
          
                if (edit_button.Tag.ToString() == "e")
                {
                if (AdminCredentialDialog.Show() == DialogResult.Yes)
                {
                    event_name.ReadOnly = false;
                    start_dateTimePicker.Enabled = true;
                    venue_textbox.ReadOnly = false;
                    details_textarea.ReadOnly = false;
                    edit_button.Tag = "s";
                    edit_button.Image = Properties.Resources.icons8_Save_Filled_32__1_;
                    start_dateTimePicker.Enabled = true;
                    cancel_button.Visible = true;
                }
                }
                else
                {
                    if (event_name.Text.Trim() == "" || (start_dateTimePicker.Value.Date > end_DateTimePicker.Value.Date) || venue_textbox.Text.Trim() == "")
                    {
                        Notification.Show(State.MissingFields);
                    }
                    else if (dh.isEventNameExist(event_name.Text, bloodlettingID))
                    {
                        Notification.Show(State.EventNameUsed);
                    }
                    else {
                        if (bloodlettingID.Equals(0)) {
                            dh.addBloodDonationEvent(event_name.Text, start_dateTimePicker.Value, end_DateTimePicker.Value, venue_textbox.Text, details_textarea.Text);
                            bloodlettingID = dh.getMaxBloodEvent() + 1;
                        }
                        else {
                            dh.editBloodDonationEvent(bloodlettingID, event_name.Text, start_dateTimePicker.Value, end_DateTimePicker.Value, venue_textbox.Text, details_textarea.Text);
                        }
                        edit_button.Tag = "e";
                        edit_button.Image = Properties.Resources.icons8_Pencil_32__1_;
                        event_name.ReadOnly = true;
                        end_DateTimePicker.Enabled = false;
                        venue_textbox.ReadOnly = true;
                        details_textarea.ReadOnly = true;
                        this.Close();
                    }
                }
        }

        private void cancel_button_Click(object sender, EventArgs e)
        {
            refreshEvent();
        }
        private void refreshEvent()
        {
            if (bloodlettingID.Equals(0))
            {
                
                start_dateTimePicker.MinDate = DateTime.Now;
                end_DateTimePicker.MinDate = start_dateTimePicker.Value;
                event_name.Clear();
                start_dateTimePicker.Value = DateTime.Now;
                end_DateTimePicker.Value = DateTime.Now;
                venue_textbox.Clear();
                details_textarea.Clear();

                event_name.ReadOnly = false;
                start_dateTimePicker.Enabled = true;
                end_DateTimePicker.Enabled = true;
                venue_textbox.ReadOnly = false;
                details_textarea.ReadOnly = false;
             
                edit_button.Tag = "s";
                edit_button.Image = Properties.Resources.icons8_Save_Filled_32__1_;
            }
            else
            {
                event_name.ReadOnly = true;
                start_dateTimePicker.Enabled = false;
                end_DateTimePicker.Enabled = false;
                venue_textbox.ReadOnly = true;
                details_textarea.ReadOnly = true;

                DataTable dt = dh.getbloodlettingEvent(bloodlettingID);
                edit_button.Tag = "e";
                edit_button.Image = Properties.Resources.icons8_Pencil_32__1_;
                event_name.Text = dt.Rows[0]["eventName"].ToString();
                start_dateTimePicker.Value = DateTime.Parse(dt.Rows[0]["startDateTime"].ToString()).Date;
                end_DateTimePicker.Value = DateTime.Parse(dt.Rows[0]["endDateTime"].ToString()).Date;
                venue_textbox.Text = dt.Rows[0]["eventVenue"].ToString();
                details_textarea.Text = dt.Rows[0]["eventDetails"].ToString();
                cancel_button.Visible = false;
            }
        }

        private void close_button_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void delete_button_Click(object sender, EventArgs e)
        {
            if (AdminCredentialDialog.Show()==DialogResult.Yes) {
                CustomMessage msg = new CustomMessage();
                if (msg.Show("Are you sure you want to delete this event?", MessageDialogButtons.YesNoCancel, MessageDialogIcon.Question) == DialogResult.Yes) {
                    try
                    {
                        dh.deleteBloodDonationEvent(bloodlettingID);
                        close_button.PerformClick();
                    }
                    catch
                    {
                        dh.conn.Close();
                        Notification.Show(State.CannotDeleteBloodEvent);
                    }
                }
            }
        }

        private void controlBar_panel_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void start_dateTimePicker_ValueChanged(object sender, EventArgs e)
        {
                end_DateTimePicker.MinDate = start_dateTimePicker.Value;
        }

        private void BloodlettingEventPopUp_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyData == Keys.Escape)
            {
                this.Close();
            }
        }

        private void start_dateTimePicker_Enter(object sender, EventArgs e)
        {
            if (start_dateTimePicker.Enabled == true)
            {
                end_DateTimePicker.MinDate = start_dateTimePicker.Value;
                end_DateTimePicker.Enabled = true;
            }
        }
    }
}
