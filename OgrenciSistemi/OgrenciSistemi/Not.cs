using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OgrenciSistemi
{
    public partial class Not : Form
    {
        public Not()
        {
            InitializeComponent();
        }
        OgrenciSistemEntities1 baglanti = new OgrenciSistemEntities1();
        public void Listele()
        {
            dataGridView1.DataSource = baglanti.Notlars .ToList();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            Listele();
        }

        private void button2_Click(object sender, EventArgs e)
        {

            Notlar  save = new Notlar ();
            save.Vize  = Convert.ToInt32 (textBox1.Text);
            save.Final = Convert.ToInt32 ( textBox2.Text);
            save.Durum = textBox3.Text;
            save.DersNo = Convert.ToInt32(textBox7.Text);
            baglanti.Notlars .Add(save);
            baglanti.SaveChanges();
            Listele();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int NotNo = Convert.ToInt32(textBox1.Tag);
            var yenile = baglanti.Notlars .Where(x => x.NotNo == NotNo).FirstOrDefault();
            yenile.Vize = Convert.ToInt32(textBox1.Text);
            yenile.Final = Convert.ToInt32(textBox2.Text); 
            yenile.Durum = textBox3.Text;
            yenile.DersNo = Convert.ToInt32(textBox7.Text);
            baglanti.SaveChanges();
            Listele();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int NotNo = Convert.ToInt32(textBox1.Tag);
            var sil = baglanti.Notlars .Where(x => x.NotNo == NotNo).FirstOrDefault();
            baglanti.Notlars .Remove(sil);
            baglanti.SaveChanges();
            Listele();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglanti.Notlars .Where(s => s.Durum.Contains(textBox3.Text)).ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["NotNo"].Value.ToString();
            textBox1.Text = satir.Cells["Vize"].Value.ToString();
            textBox2.Text = satir.Cells["Final"].Value.ToString();
            textBox3.Text = satir.Cells["Durum"].Value.ToString();
            textBox7.Text = satir.Cells["DersNo"].Value.ToString();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            OgrenciSayfasi go = new OgrenciSayfasi();
            go.Show();
            this.Hide();
        }
    }
}
