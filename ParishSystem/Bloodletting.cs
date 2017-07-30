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
    public partial class Bloodletting : Form
    {
        DataHandler dh;
        public Bloodletting(DataHandler dh)
        {
            InitializeComponent();
            this.dh = dh;
        }
        

        private void Bloodletting_Load(object sender, EventArgs e)
        {
            donors_datagridview_bloodletting.DataSource = dh.getBloodDonors();
            donors_datagridview_bloodletting.Columns["profileID"].Visible = false;
            
        }

        private void donors_datagridview_bloodletting_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            Form A = new Bloodletting_Profile_Popup(int.Parse(donors_datagridview_bloodletting.CurrentRow.Cells["profileID"].Value.ToString()),dh);
            A.ShowDialog();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form A = new Bloodletting_Profile_Popup(dh);
            A.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form A = new Bloodletting_Profile_Popup(2, dh);
            A.ShowDialog();
        }
    }
}
