namespace XPTO_Interface
{
    partial class Obras
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
            this.btnNumExemplar = new System.Windows.Forms.Button();
            this.btnTransferirObra = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.btnAddNovaObra = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnNumExemplar
            // 
            this.btnNumExemplar.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnNumExemplar.Location = new System.Drawing.Point(317, 70);
            this.btnNumExemplar.Name = "btnNumExemplar";
            this.btnNumExemplar.Size = new System.Drawing.Size(94, 83);
            this.btnNumExemplar.TabIndex = 9;
            this.btnNumExemplar.Text = "Numero de exemplar";
            this.btnNumExemplar.UseVisualStyleBackColor = true;
            // 
            // btnTransferirObra
            // 
            this.btnTransferirObra.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTransferirObra.Location = new System.Drawing.Point(513, 70);
            this.btnTransferirObra.Name = "btnTransferirObra";
            this.btnTransferirObra.Size = new System.Drawing.Size(95, 83);
            this.btnTransferirObra.TabIndex = 8;
            this.btnTransferirObra.Text = "Transferir Obra";
            this.btnTransferirObra.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(283, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(186, 22);
            this.label1.TabIndex = 6;
            this.label1.Text = "Menu de consultas";
            // 
            // btnAddNovaObra
            // 
            this.btnAddNovaObra.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAddNovaObra.Location = new System.Drawing.Point(135, 70);
            this.btnAddNovaObra.Name = "btnAddNovaObra";
            this.btnAddNovaObra.Size = new System.Drawing.Size(96, 83);
            this.btnAddNovaObra.TabIndex = 5;
            this.btnAddNovaObra.Text = "Adicionar Nova Obra";
            this.btnAddNovaObra.UseVisualStyleBackColor = true;
            // 
            // Obras
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 260);
            this.Controls.Add(this.btnNumExemplar);
            this.Controls.Add(this.btnTransferirObra);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnAddNovaObra);
            this.Name = "Obras";
            this.Text = "Obras";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnNumExemplar;
        private System.Windows.Forms.Button btnTransferirObra;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnAddNovaObra;
    }
}