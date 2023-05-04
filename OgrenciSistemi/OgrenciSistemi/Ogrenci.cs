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
    public partial class Ogrenci : Form
    {
        public Ogrenci()
        {
            InitializeComponent();
        }
        OgrenciSistemEntities1 baglanti = new OgrenciSistemEntities1();
        public void Listele()
        {
            dataGridView1.DataSource = baglanti.Ogrencilers.ToList();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Listele();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Ogrenciler  save = new Ogrenciler();
            save.OgrenciAdi = textBox1.Text;
            save.OgrenciSoyadi = textBox2.Text;
            save.Fakulte  = textBox3.Text;
            save.Bolum  = textBox4.Text;
            save.Sinif  = Convert.ToInt32 (textBox5.Text);
            save.DanismanHoca   = textBox6.Text;
            save.DersNo = Convert.ToInt32(textBox7.Text);
            baglanti.Ogrencilers.Add(save);
            baglanti.SaveChanges();
            Listele();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int OgrenciNo = Convert.ToInt32(textBox1.Tag);
            var yenile = baglanti.Ogrencilers .Where(x => x.OgrenciNo == OgrenciNo).FirstOrDefault();
            yenile.OgrenciAdi  = textBox1.Text;
            yenile.OgrenciSoyadi  = textBox2.Text;
            yenile.Fakulte  = textBox3.Text;
            yenile.Bolum  = textBox4.Text;
            yenile.Sinif  = Convert.ToInt32(textBox5.Text);
            yenile.DanismanHoca = textBox6.Text;
            yenile.DersNo = Convert .ToInt32 ( textBox7.Text);
            baglanti.SaveChanges();
            Listele();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int OgrenciNo = Convert.ToInt32(textBox1.Tag);
            var sil = baglanti.Ogrencilers .Where(x => x.OgrenciNo == OgrenciNo).FirstOrDefault();
            baglanti.Ogrencilers .Remove(sil);
            baglanti.SaveChanges();
            Listele();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglanti.Ogrencilers .Where(s => s.OgrenciAdi.Contains(textBox1.Text)).ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["OgrenciNo"].Value.ToString();
            textBox1.Text = satir.Cells["OgrenciAdi"].Value.ToString();
            textBox2.Text = satir.Cells["OgrenciSoyadi"].Value.ToString();
            textBox3.Text = satir.Cells["Fakulte"].Value.ToString();
            textBox4.Text = satir.Cells["Bolum"].Value.ToString();
            textBox5.Text = satir.Cells["Sinif"].Value.ToString();
            textBox6.Text = satir.Cells["DanismanHoca"].Value.ToString();
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
