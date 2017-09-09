﻿namespace ParishSystem
{
    partial class ItemTypes_Module
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
            this.IncomeCashReleaseType_panel = new System.Windows.Forms.Panel();
            this.searchButton = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.searchTextbox = new System.Windows.Forms.TextBox();
            this.enable_button_itemType = new System.Windows.Forms.Button();
            this.add_button_itemType = new System.Windows.Forms.Button();
            this.itemType_dgv = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.IncomeCashReleaseType_panel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.itemType_dgv)).BeginInit();
            this.SuspendLayout();
            // 
            // IncomeCashReleaseType_panel
            // 
            this.IncomeCashReleaseType_panel.BackColor = System.Drawing.Color.White;
            this.IncomeCashReleaseType_panel.Controls.Add(this.searchButton);
            this.IncomeCashReleaseType_panel.Controls.Add(this.label1);
            this.IncomeCashReleaseType_panel.Controls.Add(this.searchTextbox);
            this.IncomeCashReleaseType_panel.Controls.Add(this.enable_button_itemType);
            this.IncomeCashReleaseType_panel.Controls.Add(this.add_button_itemType);
            this.IncomeCashReleaseType_panel.Controls.Add(this.itemType_dgv);
            this.IncomeCashReleaseType_panel.Controls.Add(this.label2);
            this.IncomeCashReleaseType_panel.Location = new System.Drawing.Point(0, 0);
            this.IncomeCashReleaseType_panel.Margin = new System.Windows.Forms.Padding(0);
            this.IncomeCashReleaseType_panel.Name = "IncomeCashReleaseType_panel";
            this.IncomeCashReleaseType_panel.Size = new System.Drawing.Size(931, 543);
            this.IncomeCashReleaseType_panel.TabIndex = 0;
            // 
            // searchButton
            // 
            this.searchButton.FlatAppearance.BorderSize = 0;
            this.searchButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.searchButton.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.searchButton.Image = global::ParishSystem.Properties.Resources.icons8_Search_Filled_20;
            this.searchButton.Location = new System.Drawing.Point(867, 23);
            this.searchButton.Name = "searchButton";
            this.searchButton.Size = new System.Drawing.Size(30, 30);
            this.searchButton.TabIndex = 7;
            this.searchButton.Tag = "s";
            this.searchButton.UseVisualStyleBackColor = true;
            this.searchButton.Click += new System.EventHandler(this.searchButton_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(534, 32);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(42, 15);
            this.label1.TabIndex = 5;
            this.label1.Text = "Search";
            // 
            // searchTextbox
            // 
            this.searchTextbox.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.searchTextbox.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.searchTextbox.Location = new System.Drawing.Point(587, 28);
            this.searchTextbox.Name = "searchTextbox";
            this.searchTextbox.Size = new System.Drawing.Size(271, 22);
            this.searchTextbox.TabIndex = 4;
            this.searchTextbox.TextChanged += new System.EventHandler(this.searchTextbox_TextChanged);
            // 
            // enable_button_itemType
            // 
            this.enable_button_itemType.BackColor = System.Drawing.Color.Gray;
            this.enable_button_itemType.FlatAppearance.BorderSize = 0;
            this.enable_button_itemType.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.enable_button_itemType.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.enable_button_itemType.Font = new System.Drawing.Font("Segoe UI Semibold", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.enable_button_itemType.ForeColor = System.Drawing.Color.White;
            this.enable_button_itemType.Location = new System.Drawing.Point(537, 472);
            this.enable_button_itemType.Name = "enable_button_itemType";
            this.enable_button_itemType.Size = new System.Drawing.Size(204, 37);
            this.enable_button_itemType.TabIndex = 3;
            this.enable_button_itemType.Text = "Enable";
            this.enable_button_itemType.UseVisualStyleBackColor = false;
            this.enable_button_itemType.Click += new System.EventHandler(this.enable_button_itemType_Click);
            // 
            // add_button_itemType
            // 
            this.add_button_itemType.BackColor = System.Drawing.Color.Gray;
            this.add_button_itemType.FlatAppearance.BorderSize = 0;
            this.add_button_itemType.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.add_button_itemType.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.add_button_itemType.Font = new System.Drawing.Font("Segoe UI Semibold", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.add_button_itemType.ForeColor = System.Drawing.Color.White;
            this.add_button_itemType.Location = new System.Drawing.Point(199, 472);
            this.add_button_itemType.Name = "add_button_itemType";
            this.add_button_itemType.Size = new System.Drawing.Size(204, 37);
            this.add_button_itemType.TabIndex = 1;
            this.add_button_itemType.Text = "Add";
            this.add_button_itemType.UseVisualStyleBackColor = false;
            this.add_button_itemType.Click += new System.EventHandler(this.add_button_itemType_Click);
            // 
            // itemType_dgv
            // 
            this.itemType_dgv.AccessibleRole = System.Windows.Forms.AccessibleRole.None;
            this.itemType_dgv.AllowUserToAddRows = false;
            this.itemType_dgv.AllowUserToDeleteRows = false;
            this.itemType_dgv.AllowUserToOrderColumns = true;
            this.itemType_dgv.AllowUserToResizeRows = false;
            this.itemType_dgv.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.itemType_dgv.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.itemType_dgv.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.itemType_dgv.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.None;
            this.itemType_dgv.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.Gray;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.White;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.Black;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.itemType_dgv.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.itemType_dgv.ColumnHeadersHeight = 40;
            this.itemType_dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            this.itemType_dgv.EnableHeadersVisualStyles = false;
            this.itemType_dgv.GridColor = System.Drawing.Color.White;
            this.itemType_dgv.Location = new System.Drawing.Point(31, 66);
            this.itemType_dgv.MultiSelect = false;
            this.itemType_dgv.Name = "itemType_dgv";
            this.itemType_dgv.ReadOnly = true;
            this.itemType_dgv.RowHeadersVisible = false;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.itemType_dgv.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.itemType_dgv.RowTemplate.DefaultCellStyle.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.itemType_dgv.RowTemplate.DefaultCellStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.itemType_dgv.RowTemplate.DefaultCellStyle.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.itemType_dgv.RowTemplate.DefaultCellStyle.ForeColor = System.Drawing.Color.Black;
            this.itemType_dgv.RowTemplate.DefaultCellStyle.SelectionBackColor = System.Drawing.Color.White;
            this.itemType_dgv.RowTemplate.DefaultCellStyle.SelectionForeColor = System.Drawing.Color.Black;
            this.itemType_dgv.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.itemType_dgv.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.itemType_dgv.Size = new System.Drawing.Size(868, 383);
            this.itemType_dgv.TabIndex = 0;
            this.itemType_dgv.TabStop = false;
            this.itemType_dgv.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.itemType_dgv_CellClick);
            this.itemType_dgv.CellContentDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.itemType_dgv_CellContentDoubleClick);
            this.itemType_dgv.Click += new System.EventHandler(this.itemType_dgv_Click);
            this.itemType_dgv.KeyDown += new System.Windows.Forms.KeyEventHandler(this.itemType_dgv_KeyDown);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(584, 40);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(277, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "_____________________________________________";
            // 
            // ItemTypes_Module
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(930, 540);
            this.Controls.Add(this.IncomeCashReleaseType_panel);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "ItemTypes_Module";
            this.Text = "ItemTypes_Module";
            this.Load += new System.EventHandler(this.ItemTypes_Module_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.ItemTypes_Module_KeyDown);
            this.IncomeCashReleaseType_panel.ResumeLayout(false);
            this.IncomeCashReleaseType_panel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.itemType_dgv)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel IncomeCashReleaseType_panel;
        private System.Windows.Forms.Button enable_button_itemType;
        private System.Windows.Forms.Button add_button_itemType;
        private System.Windows.Forms.DataGridView itemType_dgv;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox searchTextbox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button searchButton;
    }
}