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
    public partial class Ogretmen : Form
    {
        public Ogretmen()
        {
            InitializeComponent();
        }
        OgrenciSistemEntities1 baglanti = new OgrenciSistemEntities1();
        public void Listele()
        {
            dataGridView1.DataSource = baglanti.Ogretmenlers .ToList();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Listele();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Ogretmenler save = new Ogretmenler();
            save.OgretmenAdi = textBox1.Text;
            save.OgretmenSoyadi = textBox2.Text;
            save.Bolum  = textBox3.Text;
            save.Unvan  = textBox4.Text;
            save.DersNo = Convert.ToInt32(textBox7.Text);
            baglanti.Ogretmenlers .Add(save);
            baglanti.SaveChanges();
            Listele();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int OgretmenNo = Convert.ToInt32(textBox1.Tag);
            var yenile = baglanti.Ogretmenlers .Where(x => x.OgretmenNo == OgretmenNo).FirstOrDefault();
            yenile.OgretmenAdi = textBox1.Text;
            yenile.OgretmenSoyadi = textBox2.Text;
            yenile.Bolum  = textBox3.Text;
            yenile.Unvan  = textBox4.Text;
            yenile.DersNo = Convert.ToInt32(textBox7.Text);
            baglanti.SaveChanges();
            Listele();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int OgretmenNo = Convert.ToInt32(textBox1.Tag);
            var sil = baglanti.Ogretmenlers.Where(x => x.OgretmenNo == OgretmenNo).FirstOrDefault();
            baglanti.Ogretmenlers.Remove(sil);
            baglanti.SaveChanges();
            Listele();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglanti.Ogretmenlers.Where(s => s.OgretmenAdi.Contains(textBox1.Text)).ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["OgretmenNo"].Value.ToString();
            textBox1.Text = satir.Cells["OgretmenAdi"].Value.ToString();
            textBox2.Text = satir.Cells["OgretmenSoyadi"].Value.ToString();
            textBox3.Text = satir.Cells["Bolum"].Value.ToString();
            textBox4.Text = satir.Cells["Unvan"].Value.ToString();
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
