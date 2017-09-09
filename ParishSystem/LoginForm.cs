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
    public partial class LoginForm : Form
    {
        Login login = new Login();
        public LoginForm()
        {
            InitializeComponent();
        }

        private void login_button_Click(object sender, EventArgs e)
        {
           if(login.verify(Username_textbox.Text, Password_textbox.Text))
            {
                this.Hide();
                SAD2 sad = new SAD2(Username_textbox.Text);
                sad.ShowDialog();
                this.Show();
            }
           else
            {
                Notification.Show(State.WrongCredentials);
            }
        }

        private void peek_button_MouseDown(object sender, MouseEventArgs e)
        {
            Password_textbox.PasswordChar = '\0';   
        }

        private void peek_button_MouseUp(object sender, MouseEventArgs e)
        {
            Password_textbox.PasswordChar = '*';
        }

        private void Close_button_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void LoginForm_Load(object sender, EventArgs e)
        {
            Draggable a = new Draggable(this);
            a.makeDraggable(panel1);
        }

        private void Password_textbox_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyData== Keys.Enter)
            {
                login_button.PerformClick();
            }
        }

        private void Username_textbox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyData == Keys.Enter)
            {
                login_button.PerformClick();
            }
        }
    }
}
