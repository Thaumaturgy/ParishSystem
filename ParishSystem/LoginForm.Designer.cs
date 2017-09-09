﻿namespace ParishSystem
{
    partial class LoginForm
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
            this.Username_textbox = new MetroFramework.Controls.MetroTextBox();
            this.Password_textbox = new MetroFramework.Controls.MetroTextBox();
            this.login_button = new System.Windows.Forms.Button();
            this.peek_button = new System.Windows.Forms.Button();
            this.Close_button = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // Username_textbox
            // 
            // 
            // 
            // 
            this.Username_textbox.CustomButton.Image = null;
            this.Username_textbox.CustomButton.Location = new System.Drawing.Point(227, 2);
            this.Username_textbox.CustomButton.Name = "";
            this.Username_textbox.CustomButton.Size = new System.Drawing.Size(25, 25);
            this.Username_textbox.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.Username_textbox.CustomButton.TabIndex = 1;
            this.Username_textbox.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.Username_textbox.CustomButton.UseSelectable = true;
            this.Username_textbox.CustomButton.Visible = false;
            this.Username_textbox.FontSize = MetroFramework.MetroTextBoxSize.Tall;
            this.Username_textbox.Lines = new string[0];
            this.Username_textbox.Location = new System.Drawing.Point(46, 74);
            this.Username_textbox.MaxLength = 32767;
            this.Username_textbox.Name = "Username_textbox";
            this.Username_textbox.PasswordChar = '\0';
            this.Username_textbox.PromptText = "Username";
            this.Username_textbox.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.Username_textbox.SelectedText = "";
            this.Username_textbox.SelectionLength = 0;
            this.Username_textbox.SelectionStart = 0;
            this.Username_textbox.ShortcutsEnabled = true;
            this.Username_textbox.Size = new System.Drawing.Size(255, 30);
            this.Username_textbox.TabIndex = 0;
            this.Username_textbox.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.Username_textbox.UseSelectable = true;
            this.Username_textbox.WaterMark = "Username";
            this.Username_textbox.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.Username_textbox.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            // 
            // Password_textbox
            // 
            // 
            // 
            // 
            this.Password_textbox.CustomButton.Image = null;
            this.Password_textbox.CustomButton.Location = new System.Drawing.Point(227, 2);
            this.Password_textbox.CustomButton.Name = "";
            this.Password_textbox.CustomButton.Size = new System.Drawing.Size(25, 25);
            this.Password_textbox.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.Password_textbox.CustomButton.TabIndex = 1;
            this.Password_textbox.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.Password_textbox.CustomButton.UseSelectable = true;
            this.Password_textbox.CustomButton.Visible = false;
            this.Password_textbox.FontSize = MetroFramework.MetroTextBoxSize.Tall;
            this.Password_textbox.Lines = new string[0];
            this.Password_textbox.Location = new System.Drawing.Point(46, 126);
            this.Password_textbox.MaxLength = 32767;
            this.Password_textbox.Name = "Password_textbox";
            this.Password_textbox.PasswordChar = '*';
            this.Password_textbox.PromptText = "Password";
            this.Password_textbox.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.Password_textbox.SelectedText = "";
            this.Password_textbox.SelectionLength = 0;
            this.Password_textbox.SelectionStart = 0;
            this.Password_textbox.ShortcutsEnabled = true;
            this.Password_textbox.Size = new System.Drawing.Size(255, 30);
            this.Password_textbox.TabIndex = 1;
            this.Password_textbox.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.Password_textbox.UseSelectable = true;
            this.Password_textbox.WaterMark = "Password";
            this.Password_textbox.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.Password_textbox.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            // 
            // login_button
            // 
            this.login_button.BackColor = System.Drawing.Color.Silver;
            this.login_button.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.login_button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.login_button.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.login_button.ForeColor = System.Drawing.Color.White;
            this.login_button.Location = new System.Drawing.Point(98, 187);
            this.login_button.Name = "login_button";
            this.login_button.Size = new System.Drawing.Size(180, 39);
            this.login_button.TabIndex = 2;
            this.login_button.Text = "Log in";
            this.login_button.UseVisualStyleBackColor = false;
            this.login_button.Click += new System.EventHandler(this.login_button_Click);
            // 
            // peek_button
            // 
            this.peek_button.FlatAppearance.BorderSize = 0;
            this.peek_button.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Silver;
            this.peek_button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.peek_button.Image = global::ParishSystem.Properties.Resources.icons8_Eye_20;
            this.peek_button.Location = new System.Drawing.Point(307, 126);
            this.peek_button.Name = "peek_button";
            this.peek_button.Size = new System.Drawing.Size(30, 30);
            this.peek_button.TabIndex = 3;
            this.peek_button.UseVisualStyleBackColor = true;
            this.peek_button.MouseDown += new System.Windows.Forms.MouseEventHandler(this.peek_button_MouseDown);
            this.peek_button.MouseUp += new System.Windows.Forms.MouseEventHandler(this.peek_button_MouseUp);
            // 
            // Close_button
            // 
            this.Close_button.Dock = System.Windows.Forms.DockStyle.Right;
            this.Close_button.FlatAppearance.BorderSize = 0;
            this.Close_button.FlatAppearance.MouseOverBackColor = System.Drawing.Color.IndianRed;
            this.Close_button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.Close_button.Image = global::ParishSystem.Properties.Resources.icons8_Delete_20;
            this.Close_button.Location = new System.Drawing.Point(341, 0);
            this.Close_button.Name = "Close_button";
            this.Close_button.Size = new System.Drawing.Size(30, 30);
            this.Close_button.TabIndex = 4;
            this.Close_button.UseVisualStyleBackColor = true;
            this.Close_button.Click += new System.EventHandler(this.Close_button_Click);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.DimGray;
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.Close_button);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(371, 30);
            this.panel1.TabIndex = 5;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(13, 4);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(139, 21);
            this.label1.TabIndex = 5;
            this.label1.Text = "Assumption Parish";
            // 
            // LoginForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.ClientSize = new System.Drawing.Size(371, 269);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.peek_button);
            this.Controls.Add(this.login_button);
            this.Controls.Add(this.Password_textbox);
            this.Controls.Add(this.Username_textbox);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "LoginForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "LoginForm";
            this.Load += new System.EventHandler(this.LoginForm_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private MetroFramework.Controls.MetroTextBox Username_textbox;
        private MetroFramework.Controls.MetroTextBox Password_textbox;
        private System.Windows.Forms.Button login_button;
        private System.Windows.Forms.Button peek_button;
        private System.Windows.Forms.Button Close_button;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
    }
}