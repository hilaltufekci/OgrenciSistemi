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
    public partial class Rapor : Form
    {
        public Rapor()
        {
            InitializeComponent();
        }
        OgrenciSistemEntities1 baglan = new OgrenciSistemEntities1();
        private void button1_Click(object sender, EventArgs e)
        {
            var query = from ogrenci in baglan.Ogrencilers orderby ogrenci.OgrenciAdi select ogrenci;
            dataGridView1.DataSource = query.ToList();
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var query = from ogrenci in baglan.Derslers orderby ogrenci.DersAdi descending select ogrenci;
            dataGridView1.DataSource = query.ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var query = baglan.Ogrencilers.Where(o => o.Fakulte == "Hukuk");
            dataGridView1.DataSource = query.ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var query = baglan.Ogrencilers.Where(o => o.Fakulte == "Hukuk" && o.Sinif==1);
            dataGridView1.DataSource = query.ToList();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            var query = baglan.Notlars.Where(o => o.Durum == "Kaldı" && o.Vize == 45);
            dataGridView1.DataSource = query.ToList();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            var query = baglan.Ogretmenlers.Where(o => o.Unvan == "Doçent" && o.Bolum == "Hukuk");
            dataGridView1.DataSource = query.ToList();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            var query = from o in baglan.Ogrencilers
                        join d in baglan.Derslers on o.DersNo equals d.DersNo
                        select new
                        {
                            o.OgrenciAdi ,
                            o.OgrenciSoyadi ,
                            o.Sinif , 
                            o.Bolum ,
                            d.DersAdi ,
                            d.AKTS 
                        };
            dataGridView1.DataSource = query.ToList();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            var query = from o in baglan.Ogrencilers
                        join d in baglan.Derslers on o.DersNo equals d.DersNo
                        join ogretmen in baglan.Ogretmenlers on o.DersNo equals ogretmen.DersNo
                        select new
                        {
                            o.OgrenciAdi,
                            o.OgrenciSoyadi,
                            o.Bolum,
                            d.DersAdi,
                            d.AKTS,
                            ogretmen.OgretmenAdi,
                            ogretmen.OgretmenSoyadi,
                            ogretmen.Unvan
                        };
            dataGridView1.DataSource = query.ToList();
        }

        private void button9_Click(object sender, EventArgs e)
        {
            OgrenciSayfasi go = new OgrenciSayfasi();
            go.Show();
            this.Hide();
        }
    }
}

