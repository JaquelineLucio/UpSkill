namespace XPTO_Interface
{
    partial class menu
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
            this.btnTotalObras = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.btnNucleos = new System.Windows.Forms.Button();
            this.btnObrasMaisRequisitadas = new System.Windows.Forms.Button();
            this.btnTotalPorAssunto = new System.Windows.Forms.Button();
            this.gwTotalObrasAssunto = new System.Windows.Forms.DataGridView();
            this.btnAddNovasObras = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.gwTotalObrasAssunto)).BeginInit();
            this.SuspendLayout();
            // 
            // btnTotalObras
            // 
            this.btnTotalObras.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTotalObras.Location = new System.Drawing.Point(73, 81);
            this.btnTotalObras.Name = "btnTotalObras";
            this.btnTotalObras.Size = new System.Drawing.Size(96, 83);
            this.btnTotalObras.TabIndex = 0;
            this.btnTotalObras.Text = "Total de Obras";
            this.btnTotalObras.UseVisualStyleBackColor = true;
            this.btnTotalObras.Click += new System.EventHandler(this.button1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(221, 37);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(186, 22);
            this.label1.TabIndex = 1;
            this.label1.Text = "Menu de consultas";
            // 
            // btnNucleos
            // 
            this.btnNucleos.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnNucleos.Location = new System.Drawing.Point(490, 81);
            this.btnNucleos.Name = "btnNucleos";
            this.btnNucleos.Size = new System.Drawing.Size(96, 83);
            this.btnNucleos.TabIndex = 2;
            this.btnNucleos.Text = "Nucleos";
            this.btnNucleos.UseVisualStyleBackColor = true;
            this.btnNucleos.Click += new System.EventHandler(this.btnNucleos_Click);
            // 
            // btnObrasMaisRequisitadas
            // 
            this.btnObrasMaisRequisitadas.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnObrasMaisRequisitadas.Location = new System.Drawing.Point(359, 81);
            this.btnObrasMaisRequisitadas.Name = "btnObrasMaisRequisitadas";
            this.btnObrasMaisRequisitadas.Size = new System.Drawing.Size(95, 83);
            this.btnObrasMaisRequisitadas.TabIndex = 3;
            this.btnObrasMaisRequisitadas.Text = "Obras Mais Requisitadas";
            this.btnObrasMaisRequisitadas.UseVisualStyleBackColor = true;
            this.btnObrasMaisRequisitadas.Click += new System.EventHandler(this.btnObrasMaisRequisitadas_Click);
            // 
            // btnTotalPorAssunto
            // 
            this.btnTotalPorAssunto.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTotalPorAssunto.Location = new System.Drawing.Point(207, 81);
            this.btnTotalPorAssunto.Name = "btnTotalPorAssunto";
            this.btnTotalPorAssunto.Size = new System.Drawing.Size(94, 83);
            this.btnTotalPorAssunto.TabIndex = 4;
            this.btnTotalPorAssunto.Text = "Total de Obras por Assunto";
            this.btnTotalPorAssunto.UseVisualStyleBackColor = true;
            this.btnTotalPorAssunto.Click += new System.EventHandler(this.btnTotalPorAssunto_Click);
            // 
            // gwTotalObrasAssunto
            // 
            this.gwTotalObrasAssunto.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gwTotalObrasAssunto.Location = new System.Drawing.Point(120, 187);
            this.gwTotalObrasAssunto.Name = "gwTotalObrasAssunto";
            this.gwTotalObrasAssunto.Size = new System.Drawing.Size(417, 211);
            this.gwTotalObrasAssunto.TabIndex = 9;
            // 
            // btnAddNovasObras
            // 
            this.btnAddNovasObras.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAddNovasObras.Location = new System.Drawing.Point(120, 425);
            this.btnAddNovasObras.Name = "btnAddNovasObras";
            this.btnAddNovasObras.Size = new System.Drawing.Size(181, 83);
            this.btnAddNovasObras.TabIndex = 10;
            this.btnAddNovasObras.Text = "Obras";
            this.btnAddNovasObras.UseVisualStyleBackColor = true;
            // 
            // button4
            // 
            this.button4.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button4.Location = new System.Drawing.Point(359, 425);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(178, 83);
            this.button4.TabIndex = 13;
            this.button4.Text = "Leitores";
            this.button4.UseVisualStyleBackColor = true;
            // 
            // menu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(758, 547);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.btnAddNovasObras);
            this.Controls.Add(this.gwTotalObrasAssunto);
            this.Controls.Add(this.btnTotalPorAssunto);
            this.Controls.Add(this.btnObrasMaisRequisitadas);
            this.Controls.Add(this.btnNucleos);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnTotalObras);
            this.Name = "menu";
            this.Text = "menu";
            this.Load += new System.EventHandler(this.menu_Load);
            ((System.ComponentModel.ISupportInitialize)(this.gwTotalObrasAssunto)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnTotalObras;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnNucleos;
        private System.Windows.Forms.Button btnObrasMaisRequisitadas;
        private System.Windows.Forms.Button btnTotalPorAssunto;
        private System.Windows.Forms.DataGridView gwTotalObrasAssunto;
        private System.Windows.Forms.Button btnAddNovasObras;
        private System.Windows.Forms.Button button4;
    }
}