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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        OgrenciSistemEntities1 baglanti = new OgrenciSistemEntities1();
        public bool GirisYap(string ad, string sifre)
        {
            var query = from p in baglanti.KullaniciGiris where p.KullaniciAdi == ad && p.KullaniciSifre == sifre select p;
            if (query.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        private void button2_Click(object sender, EventArgs e)
        {
            if (GirisYap(textBox1.Text, textBox2.Text))
            {
                MessageBox.Show("Başarılı bir şekilde giriş yaptınız..");
                OgrenciSayfasi go = new OgrenciSayfasi();
                go.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Hatalı kullanıcı adı ya da şifre tekrar deneyiniz...");
                textBox1.Clear();
                textBox2.Clear();
            }
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox2.Visible = true;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            groupBox2.Visible = false;
        }
    }
}
