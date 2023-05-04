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
    public partial class Ders : Form
    {
        public Ders()
        {
            InitializeComponent();
        }
        OgrenciSistemEntities1 baglanti = new OgrenciSistemEntities1();
        
        public void Listele()
        {
            dataGridView1.DataSource = baglanti.Derslers.ToList();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            Listele();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Dersler  save = new Dersler  ();
            save.DersAdi  = textBox1.Text;
            save.AKTS  = textBox2.Text;
            save.Donem  = textBox3.Text;
            baglanti.Derslers .Add(save);
            baglanti.SaveChanges();
            Listele();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int DersNo = Convert.ToInt32(textBox1.Tag);
            var yenile = baglanti.Derslers .Where(x => x.DersNo == DersNo).FirstOrDefault();
            yenile.DersAdi  = textBox1.Text;
            yenile.AKTS  = textBox2.Text;
            yenile.Donem  = textBox3.Text;
            baglanti.SaveChanges();
            Listele();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int DersNo = Convert.ToInt32(textBox1.Tag);
            var sil = baglanti.Derslers .Where(x => x.DersNo == DersNo).FirstOrDefault();
            baglanti.Derslers .Remove(sil);
            baglanti.SaveChanges();
            Listele();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglanti.Derslers .Where(s => s.DersAdi .Contains(textBox1.Text)).ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {

            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["DersNo"].Value.ToString();
            textBox1.Text = satir.Cells["DersAdi"].Value.ToString();
            textBox2.Text = satir.Cells["AKTS"].Value.ToString();
            textBox3.Text = satir.Cells["Donem"].Value.ToString();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            OgrenciSayfasi go = new OgrenciSayfasi();
            go.Show();
            this.Hide();
        }
    }
}
