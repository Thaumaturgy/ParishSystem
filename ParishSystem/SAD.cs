﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace ParishSystem
{
    public partial class SAD : Form
    {
        DataHandler dh = new DataHandler("localhost", "sad2", "root", "root");
        public SAD()
        {
            InitializeComponent();

        }
        #region Top Menu



        private void btn_Close_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_Min_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }


        #endregion

        #region Side Menu

        private void profile_menu_button_Click(object sender, EventArgs e)
        {
            home_panel.Hide();
            profile_panel.Show();
            refreshGeneralProfileTable();

        }
        #endregion

        #region Effects
        /*
                                        =============================================================
                                           ================Clearing TextBoxes====================
                                        =============================================================
       */
        private void firstname_textbox_MouseClick(object sender, MouseEventArgs e)
        {
            firstname_textbox.Text = "";
        }

        private void middlename_textbox_MouseClick(object sender, MouseEventArgs e)
        {
            middlename_textbox.Text = "";
        }

        private void lastname_textbox_MouseClick(object sender, MouseEventArgs e)
        {
            lastname_textbox.Text = "";
        }

        private void suffix_textbox_MouseClick(object sender, MouseEventArgs e)
        {
            suffix_textbox.Text = "";
        }
        /*
                                       =============================================================
                                          ================Moving Panel====================
                                       =============================================================
      */

        protected override void WndProc(ref Message m)
        {
            switch (m.Msg)
            {
                case 0x84:
                    base.WndProc(ref m);
                    if ((int)m.Result == 0x1)
                        m.Result = (IntPtr)0x2;
                    return;
            }

            base.WndProc(ref m);
        }


        #endregion

        #region Profiles Tab

        int lastGeneralProfile=0;

        private void refreshGeneralProfileTable()
        {//refresh general profile table
            DataTable dt = dh.getGeneralProfiles();
            generalprofile_datagridview.DataSource = dt;
            generalprofile_datagridview.Columns["profileID"].Visible = false;
            
        }

        private void generalprofile_datagridview_CellClick(object sender, DataGridViewCellEventArgs e)
        {//data grid cell click
            lastGeneralProfile = int.Parse(generalprofile_datagridview.CurrentRow.Cells["profileID"].Value.ToString());
            Console.WriteLine(lastGeneralProfile);
        }

        private void resetProfilesVariables()
        {//reset variables used by profiles tab
             lastGeneralProfile = 0;
        }
 
        private void addProfile_button_Click(object sender, EventArgs e)
        {//adds basic profile with name values only 
            if (dh.addGeneralProfile(firstname_textbox.Text, middlename_textbox.Text, lastname_textbox.Text, suffix_textbox.Text, '0', DateTime.MinValue, null, null, null)) { refreshGeneralProfileTable(); }
            else { MessageBox.Show("Entry not added"); }
        }

        private void openProfile_button_Click(object sender, EventArgs e)
        {//open person complete profile
            Form person = new Person(lastGeneralProfile, dh);
            person.ShowDialog();
        }

        private void deleteProfile_button_Click(object sender, EventArgs e)
        {
            dh.deleteGeneralProfile(lastGeneralProfile);
            refreshGeneralProfileTable();
        }










        #endregion

        
    }
}