﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

//button.performclick()
namespace ParishSystem
{
    public partial class Person : Form
    {
        public int ProfileID;
        public DataHandler dh;
        private List<Panel> panelList = new List<Panel>();
        private Dictionary<string, Panel> panelDict = new Dictionary<string, Panel>();
        public int mode;
        public int initialPageOpened = 0;
        public int ApplicationID = 0;
        public Person(int a, DataHandler b, int mode)
        {
            InitializeComponent();
            dh = b;
            ProfileID = a;
            this.mode = mode;
        }

        public Person(int applicationID, DataHandler dh, int mode,int initialPageOpened)//for those with initial opened pages
        {
            InitializeComponent();
            this.dh = dh;
            this.ApplicationID = applicationID;
            this.initialPageOpened = initialPageOpened;
            this.mode = mode;
        }


        #region GUI basic

        private void btn_Close_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Names_textbox_Leave(object sender, EventArgs e)
        {
            TextBox A = sender as TextBox;
            Console.WriteLine("-----------------------" + A.Name);
            string B = A.Name.Split('_')[0];
            if (A.Text.Trim().Equals(""))
            {
                A.Text = B;

            }
        }

        private void Names_textbox_MouseClick(object sender, EventArgs e)
        {
            TextBox A = sender as TextBox;
            if (A.Text.Equals(A.Name.Split('_')[0]))
            {
                A.Text = "";

            }
        }

        private void Names_textbox_profile_TextChanged(object sender, EventArgs e)
        {
            TextBox A = sender as TextBox;
            if (A.Text.Equals(A.Name.Split('_')[0]))
            {

            }
            else
            {

            }

        }

        private void dateTimePicker_profile_ValueChanged(object sender, EventArgs e)
        {
            DateTimePicker dtp = sender as DateTimePicker;
            dtp.Format = DateTimePickerFormat.Long;
        }
        #endregion
        //-------------here-hide recolor buttons 
        #region Profiles



        private void Person_Load(object sender, EventArgs e)
        {
            load_parents();
            if (mode == (int)Enums.Mode.GeneralProfile)
            {
                Applications_datagridview.DataSource = dh.getApplicationsOf(ProfileID);
                foreach (DataGridViewRow dgvr in Applications_datagridview.Rows)
                {
                    if (dgvr.Cells["sacramentType"].Value.ToString().Equals(Enums.SacramentType.Baptism.ToString()))
                    {
                        baptism_button.Visible = false;
                        baptism_panel.Visible = false;
                    }
                    if (dgvr.Cells["sacramentType"].Value.ToString().Equals(Enums.SacramentType.Confirmation.ToString()))
                    {
                        confirmation_button.Visible = false;
                        confirmation_panel.Visible = false;
                    }
                    if (dgvr.Cells["sacramentType"].Value.ToString().Equals(Enums.SacramentType.Marriage.ToString()))
                    {
                        marriage_button.Visible = false;
                        marriage_panel.Visible = false;
                    }
                }
                save_button_baptism.Visible = false;
                save_button_confirmation.Visible = false;
                save_button_marriage.Visible = false;

                cancel_button_baptism.Visible = false;
                cancel_button_confirmation.Visible = false;
                cancel_button_marriage.Visible = false;

            }

            else if (mode == (int)Enums.Mode.Applications)
            {
                if (initialPageOpened == 1)
                {
                    baptism_button.PerformClick();
                }
                else if (initialPageOpened == 2)
                {
                    confirmation_button.PerformClick();
                }
                else if (initialPageOpened == 3)
                {
                    marriage_button.PerformClick();
                }
            }
            DataTable DT = dh.getGeneralProfile(ProfileID);

            firstname_textbox.Text = DT.Rows[0]["firstname"].ToString();
            mi_textbox.Text = DT.Rows[0]["midname"].ToString();
            lastname_textbox.Text = DT.Rows[0]["lastname"].ToString();
            suffix_textbox.Text = DT.Rows[0]["suffix"].ToString();
            contactNumber_textbox.Text = DT.Rows[0]["contactNumber"].ToString();
            address_textbox.Text = DT.Rows[0]["address"].ToString(); 
                                                                     //   .Text = DT.Rows[0]["birthplace"].ToString();

            if (int.Parse(DT.Rows[0]["gender"].ToString()) == (int)Enums.Gender.Male)
            { genderMale_radiobutton.Checked = true; }
            else if (int.Parse(DT.Rows[0]["gender"].ToString()) == (int)Enums.Gender.Female)
            { genderFemale_radiobutton.Checked = true; }
            else
            {genderMale_radiobutton.Checked = false;
             genderFemale_radiobutton.Checked = false;}

            if (int.Parse(DT.Rows[0]["legitimacy"].ToString()) == (int)Enums.Legitimacy.Legal)
            { legitimate_radiobutton_baptism.Checked = true; }
            else if (int.Parse(DT.Rows[0]["legitimacy"].ToString()) == (int)Enums.Legitimacy.Civil)
            { civil_radiobutton_baptism.Checked = true; }
            else if (int.Parse(DT.Rows[0]["legitimacy"].ToString()) == (int)Enums.Legitimacy.Natural)
            { natural_radiobutton_baptism.Checked = true; }
            else
            {legitimate_radiobutton_baptism.Checked = false;
             civil_radiobutton_baptism.Checked = false;
             natural_radiobutton_baptism.Checked = false;}

            if (int.Parse(DT.Rows[0]["civilStatus"].ToString()) == (int)Enums.CivilStatus.Single)
                 single_radiobutton_self_marriage.Checked = true;
            else if (int.Parse(DT.Rows[0]["civilStatus"].ToString()) == (int)Enums.CivilStatus.Widowed)
                 widow_radiobutton_self_marriage.Checked = true;

            try
            { birthdate_dateTimePicker.Value = dh.toDateTime(DT.Rows[0]["birthdate"].ToString(), false);
             birthdate_dateTimePicker.Format = DateTimePickerFormat.Long;}
            catch
            {birthdate_dateTimePicker.Format = DateTimePickerFormat.Custom;}
            
             
        }


        private void load_parents()
        {
            //father
            DataTable fdt = dh.getFatherOf(ProfileID);
            try
            {
                
                firstname_textbox_father_baptism.Text = fdt.Rows[0]["firstname"].ToString();
                mi_textbox_father_baptism.Text = fdt.Rows[0]["midname"].ToString();
                lastname_textbox_father_baptism.Text = fdt.Rows[0]["lastname"].ToString();
                suffix_textbox_father_baptism.Text = fdt.Rows[0]["suffix"].ToString();
                residence_textbox_father_baptism.Text = fdt.Rows[0]["residence"].ToString();
                father_checbox.Checked = true;
                firstname_textbox_father_baptism.ReadOnly = true;
                mi_textbox_father_baptism.ReadOnly = true;
                lastname_textbox_father_baptism.ReadOnly = true;    
                suffix_textbox_father_baptism.ReadOnly = true;
                residence_textbox_father_baptism.ReadOnly = true;
                father_checbox.Enabled = false;
                
            }
            catch { }
            try
            {
                
                firstname_textbox_father_confirmation.Text = fdt.Rows[0]["firstname"].ToString();
                mi_textbox_father_confirmation.Text = fdt.Rows[0]["midname"].ToString();
                lastname_textbox_father_confirmation.Text = fdt.Rows[0]["lastname"].ToString();
                suffix_textbox_father_confirmation.Text = fdt.Rows[0]["suffix"].ToString();
                father_checkbox_confirmation.Checked = true;
                firstname_textbox_father_confirmation.ReadOnly = true;
                mi_textbox_father_confirmation.ReadOnly = true;
                lastname_textbox_father_confirmation.ReadOnly = true;
                suffix_textbox_father_confirmation.ReadOnly = true;
                father_checkbox_confirmation.Enabled = false;
            }
            catch { }
            try
            {
                
                firstname_textbox_father_self_marriage.Text = fdt.Rows[0]["firstname"].ToString();
                mi_textbox_father_self_marriage.Text = fdt.Rows[0]["midname"].ToString();
                lastname_textbox_father_self_marriage.Text = fdt.Rows[0]["lastname"].ToString();
                suffix_textbox_father_self_marriage.Text = fdt.Rows[0]["suffix"].ToString();
                residence_textbox_father_self_marriage.Text = fdt.Rows[0]["residence"].ToString();
                father_checkbox_self_marriage.Checked = true;
                firstname_textbox_father_self_marriage.ReadOnly = true;
                mi_textbox_father_self_marriage.ReadOnly = true;
                lastname_textbox_father_self_marriage.ReadOnly = true;
                suffix_textbox_father_self_marriage.ReadOnly = true;
                residence_textbox_father_self_marriage.ReadOnly = true;
                father_checkbox_self_marriage.Enabled = false;
            }
            catch { }


            //mother
       
                DataTable mdt = dh.getMotherOf(ProfileID);
                try
                {
                   
                firstname_textbox_mother_baptism.Text = mdt.Rows[0]["firstname"].ToString();
                mi_textbox_mother_baptism.Text = mdt.Rows[0]["midname"].ToString();
                lastname_textbox_mother_baptism.Text = mdt.Rows[0]["lastname"].ToString();
                suffix_textbox_mother_baptism.Text = mdt.Rows[0]["suffix"].ToString();
                residence_textbox_mother_baptism.Text = mdt.Rows[0]["residence"].ToString();
                mother_checkbox.Checked = true;
            }
                catch { }
                try
                {
                
                firstname_textbox_mother_confirmation.Text = mdt.Rows[0]["firstname"].ToString();
                mi_textbox_mother_confirmation.Text = mdt.Rows[0]["midname"].ToString();
                lastname_textbox_mother_confirmation.Text = mdt.Rows[0]["lastname"].ToString();
                suffix_textbox_mother_confirmation.Text = mdt.Rows[0]["suffix"].ToString();
                mother_checkbox_confirmation.Checked = true;
            }
                catch { }
                try
                {
                
                firstname_textbox_mother_self_marriage.Text = mdt.Rows[0]["firstname"].ToString();
                mi_textbox_mother_self_marriage.Text = mdt.Rows[0]["midname"].ToString();
                lastname_textbox_mother_self_marriage.Text = mdt.Rows[0]["lastname"].ToString();
                suffix_textbox_mother_self_marriage.Text = mdt.Rows[0]["suffix"].ToString();
                residence_textbox_mother_self_marriage.Text = mdt.Rows[0]["residence"].ToString();
                mother_checkbox_self_marriage.Checked = true;
            }
                catch { }
            
            }
            
        


        #endregion

        #region bloodletting
        //--------------bloodletting--------------------//

        private void load_bloodletting()
        {//@#@#
            donation_datagridview_bloodletting.DataSource = dh.getBloodDonations(ProfileID);
            foreach (DataGridViewColumn row in donation_datagridview_bloodletting.Columns)
            {
                row.Visible = false;
            }
            donation_datagridview_bloodletting.Columns["quantity"].Visible = true;
            donation_datagridview_bloodletting.Columns["eventName"].Visible = true;

            quantityDonation_numericupdown_bloodletting.Value = 0;
            bloodDonationEvent_combobox_bloodletting.Text = "";
            delete_button_bloodletting.Enabled = false;
            add_button_bloodletting.Text = "Add";
            add_button_bloodletting.Enabled = false;
            totalDonation_label_bloodletting.Text = dh.getTotalBloodDonationOf(ProfileID).ToString();
            bloodDonationEvent_combobox_bloodletting.Items.Clear();
            foreach (DataRow row in dh.getBloodlettingEvents().Rows)
            {
                bloodDonationEvent_combobox_bloodletting.Items.Add(new ComboboxContent(int.Parse(row["bloodDonationEventID"].ToString()), row["eventName"].ToString()));

            }

        }

        private void add_button_bloodletting_Click(object sender, EventArgs e)// add edit 
        {

            if (add_button_bloodletting.Text.Equals("Add"))
            {
                dh.addBloodDonation(ProfileID,
                                    int.Parse(quantityDonation_numericupdown_bloodletting.Value.ToString()),
                                    ((ComboboxContent)bloodDonationEvent_combobox_bloodletting.SelectedItem).ID, DateTime.Now);
                load_bloodletting();

            }
            else if (add_button_bloodletting.Text.Equals("Edit"))
            {
                int A = ((ComboboxContent)bloodDonationEvent_combobox_bloodletting.SelectedItem).ID;
                dh.editBloodDonation(ProfileID,
                                    int.Parse(quantityDonation_numericupdown_bloodletting.Value.ToString()),
                                    A,
                                    DateTime.Now);
                load_bloodletting();
                add_button_bloodletting.Text = "Add";

            }

        }


        private void delete_button_bloodletting_Click(object sender, EventArgs e)// delete
        {
            dh.deleteBloodDonation(int.Parse(donation_datagridview_bloodletting.SelectedRows[0].Cells["bloodDonationID"].Value.ToString()));
            load_bloodletting();
            add_button_bloodletting.Text = "Add";

        }

        private void donation_datagridview_bloodletting_CellClick(object sender, DataGridViewCellEventArgs e)
        {

            quantityDonation_numericupdown_bloodletting.Value = decimal.Parse(donation_datagridview_bloodletting.SelectedRows[0].Cells["quantity"].Value.ToString());
            bloodDonationEvent_combobox_bloodletting.Text = donation_datagridview_bloodletting.SelectedRows[0].Cells["eventName"].Value.ToString();
            add_button_bloodletting.Enabled = false;
            add_button_bloodletting.Text = "Edit";
            delete_button_bloodletting.Enabled = true;

        }

        private void quantityDonation_numericupdown_bloodletting_ValueChanged(object sender, EventArgs e)
        {
            if (bloodDonationEvent_combobox_bloodletting.Text.Equals("") || quantityDonation_numericupdown_bloodletting.Value.ToString().Equals("0"))
            {
                add_button_bloodletting.Enabled = false;
            }
            else
            {
                add_button_bloodletting.Enabled = true;
            }
        }

        private void bloodDonationEvent_combobox_bloodletting_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (bloodDonationEvent_combobox_bloodletting.Text.Equals("") || quantityDonation_numericupdown_bloodletting.Value.ToString().Equals("0"))
            {
                add_button_bloodletting.Enabled = false;
            }
            else
            {
                add_button_bloodletting.Enabled = true;
            }
        }

        #endregion bloodletting   

        #region baptism
        private void baptism_button_Click(object sender, EventArgs e)
        {
            baptism_panel.BringToFront();
            refreshBaptism();
        }

        private void refreshBaptism()
        {
            
            //profile
            DataTable dt = dh.getBaptismOf(ProfileID);

           
            registry_textbox_baptism.Text = dt.Rows[0]["registryNumber"].ToString();
            page_textbox_baptism.Text = dt.Rows[0]["pageNumber"].ToString();
            record_textbox_baptism.Text = dt.Rows[0]["recordNumber"].ToString();
            remarks_textbox_baptism.Text = dt.Rows[0]["remarks"].ToString();

           
            DataTable sponsors = dh.getSponsors(int.Parse(dt.Rows[0]["applicationID"].ToString()));
            //godFather
            try
            {
                godfather_checkbox.Checked = true;
                firstname_textbox_godFather_baptism.Text = sponsors.Rows[0]["firstname"].ToString();
                mi_textbox_godFather_baptism.Text = sponsors.Rows[0]["midname"].ToString();
                lastname_textbox_godFather_baptism.Text = sponsors.Rows[0]["lastname"].ToString();
                suffix_textbox_godFather_baptism.Text = sponsors.Rows[0]["suffix"].ToString();
                residence_textbox_godFather_baptism.Text = sponsors.Rows[0]["residence"].ToString();
            }
            catch
            {
                godfather_checkbox.Checked = false;
            }

            //godMother
            try
            {
                godMother_checkbox.Checked = true;
                firstname_textbox_godMother_baptism.Text = sponsors.Rows[1]["firstname"].ToString();
                mi_textbox_godMother_baptism.Text = sponsors.Rows[1]["midname"].ToString();
                lastname_textbox_godMother_baptism.Text = sponsors.Rows[1]["lastname"].ToString();
                suffix_textbox_godMother_baptism.Text = sponsors.Rows[1]["suffix"].ToString();
                residence_textbox_godMother_baptism.Text = sponsors.Rows[1]["residence"].ToString();
            }
            catch
            {
                godMother_checkbox.Checked = false;
            }


            date_datetimepicker_baptism.Value = dh.toDateTime(dt.Rows[0]["baptismDate"].ToString(), false);
            date_datetimepicker_baptism.Format = DateTimePickerFormat.Long;
            minister_combobox_baptism.Text = dt.Rows[0]["minister"].ToString();


        }

        private void godfather_checkbox_CheckedChanged(object sender, EventArgs e)
        {
            if (godfather_checkbox.Checked == true)
                godFather_panel_baptism.Visible = true;
            else
                godFather_panel_baptism.Visible = false;
        }

        private void godMother_checkbox_CheckedChanged(object sender, EventArgs e)
        {
            if (godMother_checkbox.Checked == true)
                godMother_panel_baptism.Visible = true;
            else
                godMother_panel_baptism.Visible = false;
        }

        private void father_checbox_CheckedChanged(object sender, EventArgs e)
        {
            if (father_checbox.Checked == true)
                father_panel_baptism.Visible = true;
            else
                father_panel_baptism.Visible = false;
        }

        private void mother_checkbox_CheckedChanged(object sender, EventArgs e)
        {
            if (mother_checkbox.Checked == true)
                mother_panel_baptism.Visible = true;
            else
                mother_panel_baptism.Visible = false;
        }

        public bool isNameEmpty(TextBox A)
        {
            return A.Name.Split('_')[0] == A.Text;
        }

        private void save_button_baptism_Click(object sender, EventArgs e)
        {
            if (isNameEmpty(firstname_textbox) ||
                isNameEmpty(mi_textbox) ||
                isNameEmpty(lastname_textbox) ||
                !(legitimate_radiobutton_baptism.Checked || civil_radiobutton_baptism.Checked || natural_radiobutton_baptism.Checked) ||
                birthdate_dateTimePicker.Format.Equals(DateTimePickerFormat.Custom) ||
                !(genderMale_radiobutton.Checked || genderFemale_radiobutton.Checked))
            {
                MessageBox.Show("Person Missing");
                return;
            }
            if (father_checbox.Checked &&
                ((isNameEmpty(firstname_textbox_father_baptism) ||
                isNameEmpty(mi_textbox_father_baptism) ||
                isNameEmpty(lastname_textbox_father_baptism) ||
                residence_textbox_father_baptism.Text == "")))
            {
                MessageBox.Show("Father Missing Fields");
                return;
            }
            if (
                mother_checkbox.Checked &&
                ((isNameEmpty(firstname_textbox_mother_baptism) ||
                isNameEmpty(mi_textbox_mother_baptism) ||
                isNameEmpty(lastname_textbox_mother_baptism) ||
                residence_textbox_mother_baptism.Text == "")))
            {
                MessageBox.Show("Mother Missing Fields");
                return;
            }
            if (
                godfather_checkbox.Checked &&
                ((isNameEmpty(firstname_textbox_godFather_baptism) ||
                isNameEmpty(mi_textbox_godFather_baptism) ||
                isNameEmpty(lastname_textbox_godFather_baptism) ||
                residence_textbox_godFather_baptism.Text == "")))
            {
                MessageBox.Show("God Father Missing Fields");
                return;
            }
            if (
                godMother_checkbox.Checked &&
                ((isNameEmpty(firstname_textbox_godMother_baptism) ||
                isNameEmpty(mi_textbox_godMother_baptism) ||
                isNameEmpty(lastname_textbox_godMother_baptism) ||
                residence_textbox_godMother_baptism.Text == "")))
            {
                MessageBox.Show("God Mother Missing Fields");
                return;
            }
            
            //inserting
            int gender = genderMale_radiobutton.Checked ? 1 : 2;
            dh.editGeneralProfile(ProfileID, firstname_textbox.Text, mi_textbox.Text, lastname_textbox.Text, suffix_textbox.Text, gender, dh.toDateTime(birthdate_dateTimePicker.Value.ToString(), false), contactNumber_textbox.Text, address_textbox.Text, null, null);
            if (father_checbox.Checked)//if enabled==false meaning preloaded data, if enabled==true meaning not saved data
            {
                try { dh.editFather(ProfileID,firstname_textbox_father_baptism.Text,mi_textbox_father_baptism.Text,lastname_textbox_father_baptism.Text,suffix_textbox_father_baptism.Text,residence_textbox_father_baptism.Text,null); }
                catch { dh.addParent(ProfileID, firstname_textbox_father_baptism.Text, mi_textbox_father_baptism.Text, lastname_textbox_father_baptism.Text, suffix_textbox_father_baptism.Text, 'M', residence_textbox_father_baptism.Text); }
            }
            if (mother_checkbox.Checked)
            {
                try { dh.editMother(ProfileID,firstname_textbox_mother_baptism.Text, mi_textbox_mother_baptism.Text, lastname_textbox_mother_baptism.Text, suffix_textbox_mother_baptism.Text, residence_textbox_mother_baptism.Text,null); }
                catch { dh.addParent(ProfileID, firstname_textbox_mother_baptism.Text, mi_textbox_mother_baptism.Text, lastname_textbox_mother_baptism.Text, suffix_textbox_mother_baptism.Text, 'F', residence_textbox_mother_baptism.Text); }
            }
            if (godfather_checkbox.Checked)
            {
                 dh.addSponsor(firstname_textbox_godFather_baptism.Text, mi_textbox_godFather_baptism.Text, lastname_textbox_godFather_baptism.Text, suffix_textbox_father_baptism.Text, (int)Enums.Gender.Male, residence_textbox_father_baptism.Text, ApplicationID); 
            }
            if (godMother_checkbox.Checked)
            {
                 dh.addSponsor(firstname_textbox_godMother_baptism.Text, mi_textbox_godMother_baptism.Text, lastname_textbox_godMother_baptism.Text, suffix_textbox_godMother_baptism.Text, (int)Enums.Gender.Female, residence_textbox_godMother_baptism.Text, ApplicationID); 
            }
            

        }

        private void close_button_baptism_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        #endregion

        #region confirmation
        private void confirmation_button_Click(object sender, EventArgs e)
        {
            confirmation_panel.BringToFront();
            refreshConfirmation();
        }


        private void refreshConfirmation()
        {
         
            //profile
            DataTable dt = dh.getConfirmationOf(ProfileID);



          
            DataTable sponsors = dh.getSponsors(int.Parse(dt.Rows[0]["applicationID"].ToString()));
            //godFather
            try
            {
                godfather_checkbox_confirmation.Checked = true;
                firstname_textbox_godFather_confirmation.Text = sponsors.Rows[0]["firstname"].ToString();
                mi_textbox_godFather_confirmation.Text = sponsors.Rows[0]["midname"].ToString();
                lastname_textbox_godFather_confirmation.Text = sponsors.Rows[0]["lastname"].ToString();
                suffix_textbox_godFather_confirmation.Text = sponsors.Rows[0]["suffix"].ToString();
            }
            catch
            {
                godfather_checkbox_confirmation.Checked = false;
            }
            //godMother
            try
            {
                godMother_checkbox_confirmation.Checked = true;
                firstname_textbox_godMother_confirmation.Text = sponsors.Rows[0]["firstname"].ToString();
                mi_textbox_godMother_confirmation.Text = sponsors.Rows[0]["midname"].ToString();
                lastname_textbox_godMother_confirmation.Text = sponsors.Rows[0]["lastname"].ToString();
                suffix_textbox_godMother_confirmation.Text = sponsors.Rows[0]["suffix"].ToString();
            }
            catch
            {
                dh.conn.Close();
                godMother_checkbox_confirmation.Checked = false;
            }
            minister_combobox_confirmation.Text = dt.Rows[0]["minister"].ToString();
            registry_textbox_confirmation.Text = dt.Rows[0]["registryNumber"].ToString();
            page_textbox_confirmation.Text = dt.Rows[0]["pageNumber"].ToString();
            record_textbox_confirmation.Text = dt.Rows[0]["recordNumber"].ToString();


            date_datetimepicker_confirmation.Format = DateTimePickerFormat.Long;
            date_datetimepicker_confirmation.Value = dh.toDateTime(dt.Rows[0]["confirmationDate"].ToString(), false);

        }

        private void father_checkbox_confirmation_CheckedChanged(object sender, EventArgs e)
        {
            if (father_checkbox_confirmation.Checked)
            {
                father_panel_confirmation.Visible = true;
            }
            else
            {
                father_panel_confirmation.Visible = false;
            }
        }

        private void mother_checkbox_confirmation_CheckedChanged(object sender, EventArgs e)
        {
            if (mother_checkbox_confirmation.Checked)
            {
                mother_panel_confirmation.Visible = true;
            }
            else
            {
                mother_panel_confirmation.Visible = false;
            }
        }

        private void godfather_checkbox_confirmation_CheckedChanged(object sender, EventArgs e)
        {
            if (godfather_checkbox_confirmation.Checked)
            {
                godFather_panel_confirmation.Visible = true;
            }
            else
            {
                godFather_panel_confirmation.Visible = false;
            }
        }

        private void godMother_checkbox_confirmation_CheckedChanged(object sender, EventArgs e)
        {
            if (godMother_checkbox_confirmation.Checked)
            {
                godMother_panel_confirmation.Visible = true;
            }
            else
            {
                godMother_panel_confirmation.Visible = false;
            }
        }

        #endregion

        #region marriage

        private void marriage_button_Click(object sender, EventArgs e)
        {
            marriage_panel.BringToFront();
            refreshMarriage();
        }

        private void refreshMarriage()
        {
            DataTable temp = dh.getMarriageApplications(ProfileID);


            DataTable Partners = dh.getPartners(int.Parse(temp.Rows[0]["applicationID"].ToString()), ProfileID);
            spouse_combobox_marriage.Items.Clear();
            foreach (DataRow dr in Partners.Rows)
            {
                spouse_combobox_marriage.Items.Add(new ComboboxContent(int.Parse(dr["profileID"].ToString()), dr["Name"].ToString(), dr["applicationID"].ToString()));
            }
            spouse_combobox_marriage.Text = "";

        }

        private void cancel_button_marriage_Click(object sender, EventArgs e)
        {
            load_parents();
            refreshMarriage();
        }

        private void spouse_combobox_marriage_TextChanged(object sender, EventArgs e)
        {
            if (spouse_combobox_marriage.Text != "")
            {
                DataTable dt = dh.getGeneralProfile((spouse_combobox_marriage.SelectedItem as ComboboxContent).ID, (int)Enums.SacramentType.Marriage);
                int spouseID = (spouse_combobox_marriage.SelectedItem as ComboboxContent).ID;
                firstname_textbox_spouse_marriage.Text = dt.Rows[0]["firstname"].ToString();
                mi_textbox_spouse_marriage.Text = dt.Rows[0]["midname"].ToString();
                lastname_textbox_spouse_marriage.Text = dt.Rows[0]["lastname"].ToString();
                suffix_textbox_spouse_marriage.Text = dt.Rows[0]["suffix"].ToString();
                if (int.Parse(dt.Rows[0]["civilStatus"].ToString()) == (int)Enums.CivilStatus.Single)
                    single_radiobutton_spouse_marriage.Checked = true;
                else if (int.Parse(dt.Rows[0]["civilStatus"].ToString()) == (int)Enums.CivilStatus.Widowed)
                    widowed_radiobutton_spouse_marriage.Checked = true;
                try
                {
                    birthdate_datetimepicker_spouse_marriage.Value = dh.toDateTime(dt.Rows[0]["birthdate"].ToString(), false);
                    birthdate_datetimepicker_spouse_marriage.Format = DateTimePickerFormat.Long;
                }
                catch
                {
                    birthdate_datetimepicker_spouse_marriage.Format = DateTimePickerFormat.Custom;
                }
                contactNumber_textbox_spouse_marriage.Text = dt.Rows[0]["contactNumber"].ToString();
                address_textbox_spouse_marriage.Text = dt.Rows[0]["address"].ToString();

                try
                {
                    DataTable df = dh.getFatherOf(spouseID);
                    father_checkbox_spouse_marriage.Checked = true;
                    firstname_textbox_father_spouse_marriage.Text = df.Rows[0]["firstname"].ToString();
                    mi_textbox_father_spouse_marriage.Text = df.Rows[0]["midname"].ToString();
                    lastname_textbox_father_spouse_marriage.Text = df.Rows[0]["lastname"].ToString();
                    suffix_textbox_father_spouse_marriage.Text = df.Rows[0]["suffix"].ToString();
                    residence_textbox_father_spouse_marriage.Text = df.Rows[0]["residence"].ToString();
                }
                catch
                {
                    dh.conn.Close();
                    father_checkbox_spouse_marriage.Checked = false;
                }
                try
                {
                    DataTable dm = dh.getMotherOf(spouseID);
                    mother_checkbox_spouse_marriage.Checked = true;
                    firstname_textbox_mother_spouse_marriage.Text = dm.Rows[0]["firstname"].ToString();
                    mi_textbox_mother_spouse_marriage.Text = dm.Rows[0]["midname"].ToString();
                    lastname_textbox_mother_spouse_marriage.Text = dm.Rows[0]["lastname"].ToString();
                    suffix_textbox_mother_spouse_marriage.Text = dm.Rows[0]["suffix"].ToString();
                    residence_textbox_mother_spouse_marriage.Text = dm.Rows[0]["residence"].ToString();
                }
                catch
                {
                    dh.conn.Close();
                    mother_checkbox_spouse_marriage.Checked = false;
                }// DataTable dt = dh.getGeneralProfile((spouse_combobox_marriage.SelectedItem as ComboboxContent).ID);
                DataTable a = dh.getMarriage(int.Parse((spouse_combobox_marriage.SelectedItem as ComboboxContent).Content2));
                recordNumber_textbox_marriage.Text = a.Rows[0]["recordNumber"].ToString();
                pageNumber_textbox_marriage.Text = a.Rows[0]["pageNumber"].ToString();
                registryNumber_textbox_marriage.Text = a.Rows[0]["registryNumber"].ToString();
                pageNumber_textbox_marriage.Text = a.Rows[0]["pageNumber"].ToString();
                recordNumber_textbox_marriage.Text = a.Rows[0]["recordNumber"].ToString();
                minister_combobox_marriage.Text = a.Rows[0]["ministername"].ToString();
                date_dateTimePicker_marriage.Format = DateTimePickerFormat.Long;
                date_dateTimePicker_marriage.Value = dh.toDateTime(a.Rows[0]["marriageDate"].ToString(), false);


                DataTable sponsors = dh.getSponsors(int.Parse(dt.Rows[0]["applicationID"].ToString()));
                try
                {
                    godFather_checkbox_marriage.Checked = true;
                    firstname_textbox_godMother_marriage.Text = sponsors.Rows[1]["firstname"].ToString();
                    mi_textbox_godMother_marriage.Text = sponsors.Rows[1]["midname"].ToString();
                    lastname_textbox_godMother_marriage.Text = sponsors.Rows[1]["lastname"].ToString();
                    suffix_textbox_godMother_marriage.Text = sponsors.Rows[1]["suffix"].ToString();
                    residence_textbox_godMother_marriage.Text = sponsors.Rows[1]["residence"].ToString();
                }
                catch
                {

                }
                try
                {
                    godMother_checkbox_marriage.Checked = true;
                    firstname_textbox_godFather_marriage.Text = sponsors.Rows[0]["firstname"].ToString();
                    mi_textbox_godFather_marriage.Text = sponsors.Rows[0]["midname"].ToString();
                    lastname_textbox_godFather_marriage.Text = sponsors.Rows[0]["lastname"].ToString();
                    suffix_textbox_godFather_marriage.Text = sponsors.Rows[0]["suffix"].ToString();
                    residence_textbox_godFather_marriage.Text = sponsors.Rows[0]["residence"].ToString();
                }
                catch
                {

                }
            }
            else
            {
                firstname_textbox_spouse_marriage.Text = "";
                mi_textbox_spouse_marriage.Text = "";
                lastname_textbox_spouse_marriage.Text = "";
                suffix_textbox_spouse_marriage.Text = "";
                single_radiobutton_spouse_marriage.Checked = false;
                widowed_radiobutton_spouse_marriage.Checked = false;
                birthdate_datetimepicker_spouse_marriage.Format = DateTimePickerFormat.Custom;
                contactNumber_textbox_spouse_marriage.Text = "";
                address_textbox_spouse_marriage.Text = "";

                father_checkbox_spouse_marriage.Checked = false;
                firstname_textbox_father_spouse_marriage.Text = "";
                mi_textbox_father_spouse_marriage.Text = "";
                lastname_textbox_father_spouse_marriage.Text = "";
                suffix_textbox_father_spouse_marriage.Text = "";
                residence_textbox_father_spouse_marriage.Text = "";


                mother_checkbox_spouse_marriage.Checked = false;
                firstname_textbox_mother_spouse_marriage.Text = "";
                mi_textbox_mother_spouse_marriage.Text = "";
                lastname_textbox_mother_spouse_marriage.Text = "";
                suffix_textbox_mother_spouse_marriage.Text = "";
                residence_textbox_mother_spouse_marriage.Text = "";

                recordNumber_textbox_marriage.Text = "";
                pageNumber_textbox_marriage.Text = "";
                registryNumber_textbox_marriage.Text = "";
                pageNumber_textbox_marriage.Text = "";
                recordNumber_textbox_marriage.Text = "";
                minister_combobox_marriage.Text = "";
                date_dateTimePicker_marriage.Format = DateTimePickerFormat.Custom;

                godFather_checkbox_marriage.Checked = false;
                firstname_textbox_godMother_marriage.Text = "";
                mi_textbox_godMother_marriage.Text = "";
                lastname_textbox_godMother_marriage.Text = "";
                suffix_textbox_godMother_marriage.Text = "";
                residence_textbox_godMother_marriage.Text = "";

                godMother_checkbox_marriage.Checked = false;
                firstname_textbox_godFather_marriage.Text = "";
                mi_textbox_godFather_marriage.Text = "";
                lastname_textbox_godFather_marriage.Text = "";
                suffix_textbox_godFather_marriage.Text = "";
                residence_textbox_godFather_marriage.Text = "";


            }
        }



        #endregion


        private void close_button_baptism_Click_1(object sender, EventArgs e)
        {
            load_parents();
            refreshBaptism();
        }

        private void close_button_confirmation_Click(object sender, EventArgs e)
        {
            load_parents();
            refreshConfirmation();
        }

        private void bloodletting_button_Click(object sender, EventArgs e)
        {
            bloodletting_panel.BringToFront();
            load_bloodletting();
        }

        private void clear_button_bloodletting_Click(object sender, EventArgs e)
        {
            quantityDonation_numericupdown_bloodletting.Value = 0;
            bloodDonationEvent_combobox_bloodletting.Text = "";
        }

        private void save_button_confirmation_Click(object sender, EventArgs e)
        {
            if (isNameEmpty(firstname_textbox) ||
               isNameEmpty(mi_textbox) ||
               isNameEmpty(lastname_textbox) ||
               birthdate_dateTimePicker.Format.Equals(DateTimePickerFormat.Custom) ||
               !(genderMale_radiobutton.Checked || genderFemale_radiobutton.Checked))
            {
                MessageBox.Show("Person Missing");
                return;
            }

            if (father_checkbox_confirmation.Checked && (isNameEmpty(firstname_textbox_father_confirmation) ||
                isNameEmpty(mi_textbox_father_confirmation) ||
                isNameEmpty(lastname_textbox_father_confirmation)))
            {
                MessageBox.Show("Father Missing Fields");
                return;
            }

            if (
                mother_checkbox_confirmation.Checked ||
                isNameEmpty(firstname_textbox_mother_confirmation) ||
                isNameEmpty(mi_textbox_mother_confirmation) ||
                isNameEmpty(lastname_textbox_mother_confirmation))
            {
                MessageBox.Show("Mother Missing Fields");
                return;
            }
            if (
                godfather_checkbox_confirmation.Checked ||
                isNameEmpty(firstname_textbox_godFather_confirmation) ||
                isNameEmpty(mi_textbox_godFather_confirmation) ||
                isNameEmpty(lastname_textbox_godFather_confirmation))
            {
                MessageBox.Show("God Father Missing Fields");
                return;
            }
            if (
                godMother_checkbox.Checked ||
                isNameEmpty(firstname_textbox_godMother_confirmation) ||
                isNameEmpty(mi_textbox_godMother_confirmation) ||
                isNameEmpty(lastname_textbox_godMother_confirmation))
            {
                MessageBox.Show("God Mother Missing Fields");
                return;
            }

            //inserting
            int gender = genderMale_radiobutton.Checked ? 1 : 2;
            dh.editGeneralProfile(ProfileID, firstname_textbox.Text, mi_textbox.Text, lastname_textbox.Text, suffix_textbox.Text, gender, dh.toDateTime(birthdate_dateTimePicker.Value.ToString(), false), contactNumber_textbox.Text, address_textbox.Text, null, null);
            if (father_checkbox_confirmation.Checked)//if enabled==false meaning preloaded data, if enabled==true meaning not saved data
            {
                try { dh.editFather(ProfileID, firstname_textbox_father_confirmation.Text, mi_textbox_father_confirmation.Text, lastname_textbox_father_confirmation.Text, suffix_textbox_father_confirmation.Text, null, null); }
                catch { dh.addParent(ProfileID, firstname_textbox_father_confirmation.Text, mi_textbox_father_confirmation.Text, lastname_textbox_father_confirmation.Text, suffix_textbox_father_confirmation.Text, 'M', null); }
            }
            if (mother_checkbox_confirmation.Checked)
            {
                try { dh.editMother(ProfileID, firstname_textbox_mother_confirmation.Text, mi_textbox_mother_confirmation.Text, lastname_textbox_mother_confirmation.Text, suffix_textbox_mother_confirmation.Text, null, null); }
                catch { dh.addParent(ProfileID, firstname_textbox_mother_confirmation.Text, mi_textbox_mother_confirmation.Text, lastname_textbox_mother_confirmation.Text, suffix_textbox_mother_confirmation.Text, 'F', null); }
            }
            if (godfather_checkbox.Checked)
            {
                dh.addSponsor(firstname_textbox_godFather_confirmation.Text, mi_textbox_godFather_confirmation.Text, lastname_textbox_godFather_confirmation.Text, suffix_textbox_father_confirmation.Text, (int)Enums.Gender.Male, null, ApplicationID);
            }
            if (godMother_checkbox.Checked)
            {
                dh.addSponsor(firstname_textbox_godMother_confirmation.Text, mi_textbox_godMother_confirmation.Text, lastname_textbox_godMother_confirmation.Text, suffix_textbox_godMother_confirmation.Text, (int)Enums.Gender.Female ,null,  ApplicationID);
            }
        }

        private void save_button_marriage_Click(object sender, EventArgs e)
        {
            if (isNameEmpty(firstname_textbox) ||
               isNameEmpty(mi_textbox) ||
               isNameEmpty(lastname_textbox) ||
               birthdate_dateTimePicker.Format.Equals(DateTimePickerFormat.Custom) ||
               !(genderMale_radiobutton.Checked || genderFemale_radiobutton.Checked)||
               (single_radiobutton_self_marriage.Checked||widow_radiobutton_self_marriage.Checked))
            {
                MessageBox.Show("Person Missing");
                return;
            }

            if (father_checkbox_self_marriage.Checked && 
                (isNameEmpty(firstname_textbox_father_self_marriage) ||
                isNameEmpty(mi_textbox_father_self_marriage) ||
                isNameEmpty(lastname_textbox_father_self_marriage) ||
                isNameEmpty(residence_textbox_father_self_marriage)))

            {
                MessageBox.Show("Father Missing Fields");
                return;
            }

            if (mother_checkbox_self_marriage.Checked &&
                (isNameEmpty(firstname_textbox_mother_self_marriage) ||
                isNameEmpty(mi_textbox_mother_self_marriage) ||
                isNameEmpty(lastname_textbox_mother_self_marriage)||
                isNameEmpty(residence_textbox_mother_self_marriage)))

            {
                MessageBox.Show("Mother Missing Fields");
                return;
            }
            if (godFather_checkbox_marriage.Checked &&
                (isNameEmpty(firstname_textbox_godFather_confirmation) ||
                isNameEmpty(mi_textbox_godFather_confirmation) ||
                isNameEmpty(lastname_textbox_godFather_confirmation)||
                isNameEmpty(residence_textbox_godFather_marriage)))
            {
                MessageBox.Show("God Father Missing Fields");
                return;
            }
            if (godMother_checkbox_marriage.Checked &&
                (isNameEmpty(firstname_textbox_godMother_confirmation) ||
                isNameEmpty(mi_textbox_godMother_confirmation) ||
                isNameEmpty(lastname_textbox_godMother_confirmation)||
                isNameEmpty(residence_textbox_godMother_marriage)))
            {
                MessageBox.Show("God Mother Missing Fields");
                return;
            }

            //inserting
            int gender = genderMale_radiobutton.Checked ? 1 : 2;
            dh.editGeneralProfile(ProfileID, firstname_textbox.Text, mi_textbox.Text, lastname_textbox.Text, suffix_textbox.Text, gender, dh.toDateTime(birthdate_dateTimePicker.Value.ToString(), false), contactNumber_textbox.Text, address_textbox.Text, null, null);
            if (father_checkbox_confirmation.Checked)//if enabled==false meaning preloaded data, if enabled==true meaning not saved data
            {
                try { dh.editFather(ProfileID, firstname_textbox_father_baptism.Text, mi_textbox_father_baptism.Text, lastname_textbox_father_baptism.Text, suffix_textbox_father_baptism.Text, residence_textbox_father_baptism.Text, null); }
                catch { dh.addParent(ProfileID, firstname_textbox_father_baptism.Text, mi_textbox_father_baptism.Text, lastname_textbox_father_baptism.Text, suffix_textbox_father_baptism.Text, 'M', residence_textbox_father_baptism.Text); }
            }
            if (mother_checkbox.Checked)
            {
                try { dh.editMother(ProfileID, firstname_textbox_mother_baptism.Text, mi_textbox_mother_baptism.Text, lastname_textbox_mother_baptism.Text, suffix_textbox_mother_baptism.Text, residence_textbox_mother_baptism.Text, null); }
                catch { dh.addParent(ProfileID, firstname_textbox_mother_baptism.Text, mi_textbox_mother_baptism.Text, lastname_textbox_mother_baptism.Text, suffix_textbox_mother_baptism.Text, 'F', residence_textbox_mother_baptism.Text); }
            }
            if (godfather_checkbox.Checked)
            {
                dh.addSponsor(firstname_textbox_godFather_baptism.Text, mi_textbox_godFather_baptism.Text, lastname_textbox_godFather_baptism.Text, suffix_textbox_father_baptism.Text, (int)Enums.Gender.Male, residence_textbox_father_baptism.Text, ApplicationID);
            }
            if (godMother_checkbox.Checked)
            {
                dh.addSponsor(firstname_textbox_godMother_baptism.Text, mi_textbox_godMother_baptism.Text, lastname_textbox_godMother_baptism.Text, suffix_textbox_godMother_baptism.Text, (int)Enums.Gender.Female, residence_textbox_godMother_baptism.Text, ApplicationID);
            }
        }

        private void father_panel_baptism_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label67_Click(object sender, EventArgs e)
        {

        }
    }
}
