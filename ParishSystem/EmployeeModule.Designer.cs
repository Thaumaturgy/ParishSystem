﻿namespace ParishSystem
{
    partial class EmployeeModule
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            this.EmployeeDGV = new System.Windows.Forms.DataGridView();
            this.panel = new System.Windows.Forms.Panel();
            this.password_textbox = new MetroFramework.Controls.MetroTextBox();
            this.username_textbox = new MetroFramework.Controls.MetroTextBox();
            this.middleinitial_textbox = new MetroFramework.Controls.MetroTextBox();
            this.firstname_textbox = new MetroFramework.Controls.MetroTextBox();
            this.suffix_textbox = new MetroFramework.Controls.MetroTextBox();
            this.lastname_textbox = new MetroFramework.Controls.MetroTextBox();
            this.employeeID_label = new System.Windows.Forms.Label();
            this.resetPassword_button = new System.Windows.Forms.Button();
            this.clear_button = new System.Windows.Forms.Button();
            this.add_button = new System.Windows.Forms.Button();
            this.active_checkbox = new System.Windows.Forms.CheckBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.privilege_combobox = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.EmployeeDGV)).BeginInit();
            this.panel.SuspendLayout();
            this.SuspendLayout();
            // 
            // EmployeeDGV
            // 
            this.EmployeeDGV.AccessibleRole = System.Windows.Forms.AccessibleRole.None;
            this.EmployeeDGV.AllowUserToAddRows = false;
            this.EmployeeDGV.AllowUserToDeleteRows = false;
            this.EmployeeDGV.AllowUserToOrderColumns = true;
            this.EmployeeDGV.AllowUserToResizeRows = false;
            this.EmployeeDGV.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.EmployeeDGV.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.EmployeeDGV.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.EmployeeDGV.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.None;
            this.EmployeeDGV.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.Gray;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI", 12F);
            dataGridViewCellStyle1.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.Gray;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.EmployeeDGV.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.EmployeeDGV.ColumnHeadersHeight = 40;
            this.EmployeeDGV.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.Maroon;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Segoe UI", 12F);
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.Color.Yellow;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.EmployeeDGV.DefaultCellStyle = dataGridViewCellStyle2;
            this.EmployeeDGV.EnableHeadersVisualStyles = false;
            this.EmployeeDGV.GridColor = System.Drawing.Color.White;
            this.EmployeeDGV.Location = new System.Drawing.Point(28, 27);
            this.EmployeeDGV.MultiSelect = false;
            this.EmployeeDGV.Name = "EmployeeDGV";
            this.EmployeeDGV.ReadOnly = true;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Segoe UI", 12F);
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.Magenta;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.EmployeeDGV.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.EmployeeDGV.RowHeadersVisible = false;
            this.EmployeeDGV.RowHeadersWidth = 50;
            dataGridViewCellStyle4.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            dataGridViewCellStyle4.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.Color.Maroon;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.Color.DarkRed;
            this.EmployeeDGV.RowsDefaultCellStyle = dataGridViewCellStyle4;
            this.EmployeeDGV.RowTemplate.DefaultCellStyle.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.EmployeeDGV.RowTemplate.DefaultCellStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.EmployeeDGV.RowTemplate.DefaultCellStyle.ForeColor = System.Drawing.Color.Black;
            this.EmployeeDGV.RowTemplate.DefaultCellStyle.SelectionBackColor = System.Drawing.Color.White;
            this.EmployeeDGV.RowTemplate.DefaultCellStyle.SelectionForeColor = System.Drawing.Color.Black;
            this.EmployeeDGV.RowTemplate.Height = 35;
            this.EmployeeDGV.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.EmployeeDGV.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.EmployeeDGV.Size = new System.Drawing.Size(483, 492);
            this.EmployeeDGV.TabIndex = 4;
            this.EmployeeDGV.CellContentDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.EmployeeDGV_CellContentDoubleClick);
            // 
            // panel
            // 
            this.panel.Controls.Add(this.privilege_combobox);
            this.panel.Controls.Add(this.password_textbox);
            this.panel.Controls.Add(this.username_textbox);
            this.panel.Controls.Add(this.middleinitial_textbox);
            this.panel.Controls.Add(this.firstname_textbox);
            this.panel.Controls.Add(this.suffix_textbox);
            this.panel.Controls.Add(this.lastname_textbox);
            this.panel.Controls.Add(this.employeeID_label);
            this.panel.Controls.Add(this.resetPassword_button);
            this.panel.Controls.Add(this.clear_button);
            this.panel.Controls.Add(this.add_button);
            this.panel.Controls.Add(this.active_checkbox);
            this.panel.Controls.Add(this.label1);
            this.panel.Controls.Add(this.label2);
            this.panel.Controls.Add(this.label3);
            this.panel.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel.Location = new System.Drawing.Point(517, 27);
            this.panel.Name = "panel";
            this.panel.Size = new System.Drawing.Size(406, 492);
            this.panel.TabIndex = 5;
            // 
            // password_textbox
            // 
            // 
            // 
            // 
            this.password_textbox.CustomButton.FlatAppearance.BorderSize = 0;
            this.password_textbox.CustomButton.Image = null;
            this.password_textbox.CustomButton.Location = new System.Drawing.Point(185, 1);
            this.password_textbox.CustomButton.Name = "";
            this.password_textbox.CustomButton.Size = new System.Drawing.Size(21, 21);
            this.password_textbox.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.password_textbox.CustomButton.TabIndex = 1;
            this.password_textbox.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.password_textbox.CustomButton.UseSelectable = true;
            this.password_textbox.CustomButton.Visible = false;
            this.password_textbox.FontSize = MetroFramework.MetroTextBoxSize.Medium;
            this.password_textbox.Lines = new string[0];
            this.password_textbox.Location = new System.Drawing.Point(102, 189);
            this.password_textbox.MaxLength = 32767;
            this.password_textbox.Name = "password_textbox";
            this.password_textbox.PasswordChar = '\0';
            this.password_textbox.PromptText = "Password";
            this.password_textbox.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.password_textbox.SelectedText = "";
            this.password_textbox.SelectionLength = 0;
            this.password_textbox.SelectionStart = 0;
            this.password_textbox.ShortcutsEnabled = true;
            this.password_textbox.ShowClearButton = true;
            this.password_textbox.Size = new System.Drawing.Size(207, 23);
            this.password_textbox.TabIndex = 43;
            this.password_textbox.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.password_textbox.UseSelectable = true;
            this.password_textbox.WaterMark = "Password";
            this.password_textbox.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.password_textbox.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.password_textbox.TextChanged += new System.EventHandler(this.password_textbox_TextChanged);
            // 
            // username_textbox
            // 
            // 
            // 
            // 
            this.username_textbox.CustomButton.FlatAppearance.BorderSize = 0;
            this.username_textbox.CustomButton.Image = null;
            this.username_textbox.CustomButton.Location = new System.Drawing.Point(185, 1);
            this.username_textbox.CustomButton.Name = "";
            this.username_textbox.CustomButton.Size = new System.Drawing.Size(21, 21);
            this.username_textbox.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.username_textbox.CustomButton.TabIndex = 1;
            this.username_textbox.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.username_textbox.CustomButton.UseSelectable = true;
            this.username_textbox.CustomButton.Visible = false;
            this.username_textbox.FontSize = MetroFramework.MetroTextBoxSize.Medium;
            this.username_textbox.Lines = new string[0];
            this.username_textbox.Location = new System.Drawing.Point(102, 131);
            this.username_textbox.MaxLength = 32767;
            this.username_textbox.Name = "username_textbox";
            this.username_textbox.PasswordChar = '\0';
            this.username_textbox.PromptText = "Username";
            this.username_textbox.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.username_textbox.SelectedText = "";
            this.username_textbox.SelectionLength = 0;
            this.username_textbox.SelectionStart = 0;
            this.username_textbox.ShortcutsEnabled = true;
            this.username_textbox.ShowClearButton = true;
            this.username_textbox.Size = new System.Drawing.Size(207, 23);
            this.username_textbox.TabIndex = 42;
            this.username_textbox.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.username_textbox.UseSelectable = true;
            this.username_textbox.WaterMark = "Username";
            this.username_textbox.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.username_textbox.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.username_textbox.TextChanged += new System.EventHandler(this.username_textbox_TextChanged);
            // 
            // middleinitial_textbox
            // 
            // 
            // 
            // 
            this.middleinitial_textbox.CustomButton.FlatAppearance.BorderSize = 0;
            this.middleinitial_textbox.CustomButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.middleinitial_textbox.CustomButton.Image = null;
            this.middleinitial_textbox.CustomButton.Location = new System.Drawing.Point(23, 1);
            this.middleinitial_textbox.CustomButton.Name = "";
            this.middleinitial_textbox.CustomButton.Size = new System.Drawing.Size(21, 21);
            this.middleinitial_textbox.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.middleinitial_textbox.CustomButton.TabIndex = 1;
            this.middleinitial_textbox.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.middleinitial_textbox.CustomButton.UseSelectable = true;
            this.middleinitial_textbox.CustomButton.Visible = false;
            this.middleinitial_textbox.FontSize = MetroFramework.MetroTextBoxSize.Medium;
            this.middleinitial_textbox.Lines = new string[0];
            this.middleinitial_textbox.Location = new System.Drawing.Point(339, 80);
            this.middleinitial_textbox.Margin = new System.Windows.Forms.Padding(0);
            this.middleinitial_textbox.MaxLength = 32767;
            this.middleinitial_textbox.Name = "middleinitial_textbox";
            this.middleinitial_textbox.PasswordChar = '\0';
            this.middleinitial_textbox.PromptText = "Mi";
            this.middleinitial_textbox.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.middleinitial_textbox.SelectedText = "";
            this.middleinitial_textbox.SelectionLength = 0;
            this.middleinitial_textbox.SelectionStart = 0;
            this.middleinitial_textbox.ShortcutsEnabled = true;
            this.middleinitial_textbox.ShowClearButton = true;
            this.middleinitial_textbox.Size = new System.Drawing.Size(45, 23);
            this.middleinitial_textbox.TabIndex = 41;
            this.middleinitial_textbox.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.middleinitial_textbox.UseSelectable = true;
            this.middleinitial_textbox.WaterMark = "Mi";
            this.middleinitial_textbox.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.middleinitial_textbox.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.middleinitial_textbox.TextChanged += new System.EventHandler(this.middleinitial_textbox_TextChanged);
            // 
            // firstname_textbox
            // 
            // 
            // 
            // 
            this.firstname_textbox.CustomButton.FlatAppearance.BorderSize = 0;
            this.firstname_textbox.CustomButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.firstname_textbox.CustomButton.Image = null;
            this.firstname_textbox.CustomButton.Location = new System.Drawing.Point(102, 1);
            this.firstname_textbox.CustomButton.Name = "";
            this.firstname_textbox.CustomButton.Size = new System.Drawing.Size(21, 21);
            this.firstname_textbox.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.firstname_textbox.CustomButton.TabIndex = 1;
            this.firstname_textbox.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.firstname_textbox.CustomButton.UseSelectable = true;
            this.firstname_textbox.CustomButton.Visible = false;
            this.firstname_textbox.FontSize = MetroFramework.MetroTextBoxSize.Medium;
            this.firstname_textbox.Lines = new string[0];
            this.firstname_textbox.Location = new System.Drawing.Point(209, 80);
            this.firstname_textbox.Margin = new System.Windows.Forms.Padding(0);
            this.firstname_textbox.MaxLength = 32767;
            this.firstname_textbox.Name = "firstname_textbox";
            this.firstname_textbox.PasswordChar = '\0';
            this.firstname_textbox.PromptText = "Firstname";
            this.firstname_textbox.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.firstname_textbox.SelectedText = "";
            this.firstname_textbox.SelectionLength = 0;
            this.firstname_textbox.SelectionStart = 0;
            this.firstname_textbox.ShortcutsEnabled = true;
            this.firstname_textbox.ShowClearButton = true;
            this.firstname_textbox.Size = new System.Drawing.Size(124, 23);
            this.firstname_textbox.TabIndex = 40;
            this.firstname_textbox.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.firstname_textbox.UseSelectable = true;
            this.firstname_textbox.WaterMark = "Firstname";
            this.firstname_textbox.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.firstname_textbox.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.firstname_textbox.TextChanged += new System.EventHandler(this.firstname_textbox_TextChanged);
            // 
            // suffix_textbox
            // 
            // 
            // 
            // 
            this.suffix_textbox.CustomButton.FlatAppearance.BorderSize = 0;
            this.suffix_textbox.CustomButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.suffix_textbox.CustomButton.Image = null;
            this.suffix_textbox.CustomButton.Location = new System.Drawing.Point(23, 1);
            this.suffix_textbox.CustomButton.Name = "";
            this.suffix_textbox.CustomButton.Size = new System.Drawing.Size(21, 21);
            this.suffix_textbox.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.suffix_textbox.CustomButton.TabIndex = 1;
            this.suffix_textbox.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.suffix_textbox.CustomButton.UseSelectable = true;
            this.suffix_textbox.CustomButton.Visible = false;
            this.suffix_textbox.FontSize = MetroFramework.MetroTextBoxSize.Medium;
            this.suffix_textbox.Lines = new string[0];
            this.suffix_textbox.Location = new System.Drawing.Point(158, 80);
            this.suffix_textbox.Margin = new System.Windows.Forms.Padding(0);
            this.suffix_textbox.MaxLength = 32767;
            this.suffix_textbox.Name = "suffix_textbox";
            this.suffix_textbox.PasswordChar = '\0';
            this.suffix_textbox.PromptText = "Sf";
            this.suffix_textbox.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.suffix_textbox.SelectedText = "";
            this.suffix_textbox.SelectionLength = 0;
            this.suffix_textbox.SelectionStart = 0;
            this.suffix_textbox.ShortcutsEnabled = true;
            this.suffix_textbox.ShowClearButton = true;
            this.suffix_textbox.Size = new System.Drawing.Size(45, 23);
            this.suffix_textbox.TabIndex = 39;
            this.suffix_textbox.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.suffix_textbox.UseSelectable = true;
            this.suffix_textbox.WaterMark = "Sf";
            this.suffix_textbox.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.suffix_textbox.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            // 
            // lastname_textbox
            // 
            // 
            // 
            // 
            this.lastname_textbox.CustomButton.FlatAppearance.BorderSize = 0;
            this.lastname_textbox.CustomButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.lastname_textbox.CustomButton.Image = null;
            this.lastname_textbox.CustomButton.Location = new System.Drawing.Point(102, 1);
            this.lastname_textbox.CustomButton.Name = "";
            this.lastname_textbox.CustomButton.Size = new System.Drawing.Size(21, 21);
            this.lastname_textbox.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.lastname_textbox.CustomButton.TabIndex = 1;
            this.lastname_textbox.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.lastname_textbox.CustomButton.UseSelectable = true;
            this.lastname_textbox.CustomButton.Visible = false;
            this.lastname_textbox.FontSize = MetroFramework.MetroTextBoxSize.Medium;
            this.lastname_textbox.Lines = new string[0];
            this.lastname_textbox.Location = new System.Drawing.Point(28, 80);
            this.lastname_textbox.Margin = new System.Windows.Forms.Padding(0);
            this.lastname_textbox.MaxLength = 32767;
            this.lastname_textbox.Name = "lastname_textbox";
            this.lastname_textbox.PasswordChar = '\0';
            this.lastname_textbox.PromptText = "Lastname";
            this.lastname_textbox.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.lastname_textbox.SelectedText = "";
            this.lastname_textbox.SelectionLength = 0;
            this.lastname_textbox.SelectionStart = 0;
            this.lastname_textbox.ShortcutsEnabled = true;
            this.lastname_textbox.ShowClearButton = true;
            this.lastname_textbox.Size = new System.Drawing.Size(124, 23);
            this.lastname_textbox.TabIndex = 38;
            this.lastname_textbox.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.lastname_textbox.UseSelectable = true;
            this.lastname_textbox.WaterMark = "Lastname";
            this.lastname_textbox.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.lastname_textbox.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lastname_textbox.TextChanged += new System.EventHandler(this.lastname_textbox_TextChanged);
            this.lastname_textbox.Click += new System.EventHandler(this.lastname_textbox_Click);
            // 
            // employeeID_label
            // 
            this.employeeID_label.AutoSize = true;
            this.employeeID_label.Location = new System.Drawing.Point(15, 21);
            this.employeeID_label.Name = "employeeID_label";
            this.employeeID_label.Size = new System.Drawing.Size(28, 21);
            this.employeeID_label.TabIndex = 37;
            this.employeeID_label.Text = "00";
            this.employeeID_label.Visible = false;
            // 
            // resetPassword_button
            // 
            this.resetPassword_button.BackColor = System.Drawing.Color.Gray;
            this.resetPassword_button.FlatAppearance.BorderSize = 0;
            this.resetPassword_button.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Gray;
            this.resetPassword_button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.resetPassword_button.ForeColor = System.Drawing.Color.White;
            this.resetPassword_button.Location = new System.Drawing.Point(315, 182);
            this.resetPassword_button.Name = "resetPassword_button";
            this.resetPassword_button.Size = new System.Drawing.Size(30, 30);
            this.resetPassword_button.TabIndex = 26;
            this.resetPassword_button.Text = "R";
            this.resetPassword_button.UseVisualStyleBackColor = false;
            this.resetPassword_button.Visible = false;
            this.resetPassword_button.Click += new System.EventHandler(this.resetPassword_button_Click);
            // 
            // clear_button
            // 
            this.clear_button.BackColor = System.Drawing.Color.Gray;
            this.clear_button.FlatAppearance.BorderSize = 0;
            this.clear_button.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Gray;
            this.clear_button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.clear_button.ForeColor = System.Drawing.Color.White;
            this.clear_button.Location = new System.Drawing.Point(105, 399);
            this.clear_button.Name = "clear_button";
            this.clear_button.Size = new System.Drawing.Size(204, 37);
            this.clear_button.TabIndex = 25;
            this.clear_button.Text = "Clear";
            this.clear_button.UseVisualStyleBackColor = false;
            this.clear_button.Click += new System.EventHandler(this.clear_button_Click);
            // 
            // add_button
            // 
            this.add_button.BackColor = System.Drawing.Color.Gray;
            this.add_button.Enabled = false;
            this.add_button.FlatAppearance.BorderSize = 0;
            this.add_button.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Gray;
            this.add_button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.add_button.ForeColor = System.Drawing.Color.White;
            this.add_button.Location = new System.Drawing.Point(105, 342);
            this.add_button.Name = "add_button";
            this.add_button.Size = new System.Drawing.Size(204, 37);
            this.add_button.TabIndex = 23;
            this.add_button.Tag = "a";
            this.add_button.Text = "Add";
            this.add_button.UseVisualStyleBackColor = false;
            this.add_button.Click += new System.EventHandler(this.addButton_Click);
            // 
            // active_checkbox
            // 
            this.active_checkbox.AutoSize = true;
            this.active_checkbox.Checked = true;
            this.active_checkbox.CheckState = System.Windows.Forms.CheckState.Checked;
            this.active_checkbox.Enabled = false;
            this.active_checkbox.Location = new System.Drawing.Point(175, 279);
            this.active_checkbox.Name = "active_checkbox";
            this.active_checkbox.Size = new System.Drawing.Size(71, 25);
            this.active_checkbox.TabIndex = 22;
            this.active_checkbox.Text = "Active";
            this.active_checkbox.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(14, 91);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(388, 21);
            this.label1.TabIndex = 32;
            this.label1.Text = "______________________________________________________";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(98, 142);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(220, 21);
            this.label2.TabIndex = 35;
            this.label2.Text = "______________________________";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(98, 199);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(220, 21);
            this.label3.TabIndex = 36;
            this.label3.Text = "______________________________";
            // 
            // privilege_combobox
            // 
            this.privilege_combobox.FormattingEnabled = true;
            this.privilege_combobox.Items.AddRange(new object[] {
            "",
            "Bookkeeper",
            "Secretary",
            "Priest"});
            this.privilege_combobox.Location = new System.Drawing.Point(105, 233);
            this.privilege_combobox.Name = "privilege_combobox";
            this.privilege_combobox.Size = new System.Drawing.Size(204, 29);
            this.privilege_combobox.TabIndex = 44;
            // 
            // EmployeeModule
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(935, 547);
            this.Controls.Add(this.panel);
            this.Controls.Add(this.EmployeeDGV);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "EmployeeModule";
            this.Text = "EmployeeModule";
            this.Load += new System.EventHandler(this.EmployeeModule_Load);
            ((System.ComponentModel.ISupportInitialize)(this.EmployeeDGV)).EndInit();
            this.panel.ResumeLayout(false);
            this.panel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView EmployeeDGV;
        private System.Windows.Forms.Panel panel;
        private System.Windows.Forms.CheckBox active_checkbox;
        private System.Windows.Forms.Button clear_button;
        private System.Windows.Forms.Button add_button;
        private System.Windows.Forms.Button resetPassword_button;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label employeeID_label;
        private MetroFramework.Controls.MetroTextBox lastname_textbox;
        private MetroFramework.Controls.MetroTextBox middleinitial_textbox;
        private MetroFramework.Controls.MetroTextBox firstname_textbox;
        private MetroFramework.Controls.MetroTextBox suffix_textbox;
        private MetroFramework.Controls.MetroTextBox password_textbox;
        private MetroFramework.Controls.MetroTextBox username_textbox;
        private System.Windows.Forms.ComboBox privilege_combobox;
    }
}