﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
using System.Collections;
using Model;
using BLL;
namespace ShouPiao
{
    public partial class frmMain : Form
    {
        DbSqlHelper db = new DbSqlHelper();
        DataSet ds = null;
        Hashtable dta = new Hashtable();

        private Movie selMovie;
        private string selCusTypeName;
        private List<Position> selPositions;

        public frmMain()
        {
            InitializeComponent();
        }


        private void AddCustomerTypes()
        {
            CustomerTypeBLL cbll = new CustomerTypeBLL();
            this.comboBox1.Items.Clear();
            foreach (CustomerType cu in cbll.GetAllCustomerType())
            {
                this.comboBox1.Items.Add(cu.Name);
            }
        }

        private void FrmCinema_Load(object sender, EventArgs e)
        {
            this.AddCustomerTypes();
            BingTreeView();
            dgvPosition.RowCount = 10;
            dgvPosition.ColumnCount = 10;
            this.GetAndBindPositions();

        }


        private void tvMovies_AfterSelect(object sender, TreeViewEventArgs e)
        {
            TreeNode sel = this.tvMovies.SelectedNode;
            Movie m = sel.Tag as Movie;

            if (m != null)
            {
                this.selMovie = m;
                this.lblMovieName.Text = m.Name;
                this.lblType.Text = m.MovieTypeName;
                this.lblTime.Text = ((int)m.Duration).ToString();
                this.picMovie.Image = m.Poster;
                this.lblPrice.Text = "60";
            }
            else
            {
                this.lblMovieName.Text = "";
                this.lblType.Text = "";
                this.lblTime.Text = "";
                this.picMovie.Image = null;
                this.lblPrice.Text = "";
            }

        }

        private void GetAndBindPositions()
        {
            PositionBLL pbll = new PositionBLL();
            var lstPositions = pbll.GetAllPosition();
            this.FillPositions(lstPositions);

            //foreach (DataGridViewRow row in this.dgvPosition.Rows)
            //    foreach (DataGridViewColumn col in this.dgvPosition.Columns)
            //    {
            //        DataGridViewCell cell = row.Cells[col.Index];
            //        var foundPosition = lstPositions.FirstOrDefault(p => p.RowNum == row.Index + 1 && p.ColNum == col.Index + 1);
            //        if (foundPosition == null)
            //            cell.Style.BackColor = Color.White;
            //        else
            //        {
            //            if (foundPosition.UseAble)
            //                cell.Style.BackColor = Color.Blue;
            //            else
            //                cell.Style.BackColor = Color.Red;
            //        }
            //    }
        }

        private void GetAndBindMoviesInType(MovieType t)
        {
            MovieBLL mbll = new MovieBLL();
            var lstMovies = mbll.GetAllFromSqlSever(t.Id);
            foreach (Movie m in lstMovies)
            {
                this.tvMovies.Nodes.Add(m.Name).Tag = m;
            }
        }

        /// <summary>
        /// 获取放映列表绑定到TreeView
        /// </summary>
        private void BingTreeView()
        {
            this.tvMovies.Nodes.Clear();
            MovieTypeBLL tbll = new MovieTypeBLL();
            var lstTypes = tbll.GetLeixi();

            foreach (MovieType t in lstTypes)
            {
                this.GetAndBindMoviesInType(t);
            }

        }

        //confirm
        private void button1_Click(object sender, EventArgs e)
        {
            if (this.selMovie == null
                || string.IsNullOrWhiteSpace(this.selCusTypeName)
                || this.selPositions.Count == 0)
            {
                MessageBox.Show("请先选择电影、客户类型、座位");
                return;
            }
            string msg = this.selMovie.Name + "\r\n" + this.selCusTypeName + "\r\n";
            msg += string.Join("\r\n", this.selPositions.Select(x => x.GetMessagePoint()));
            if (MessageBox.Show(msg, "确认", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                this.Text = "yes";
            }
            else
                this.Text = "no";

        }

        private void tpCinema_Click(object sender, EventArgs e)
        {

        }

        private bool CanCellSelect(Position p)
        {
            return p != null && p.PositionTypeName != "通道" && p.UseAble;
        }

        private bool CanCellSelect(DataGridViewCell cell)
        {
            Position p = cell.Value as Position;
            return CanCellSelect(p);
        }

        private void FillPositions(List<Position> posList)
        {
            int rowMin = int.MaxValue, colMin = int.MaxValue;
            int rowMax = int.MinValue, colMax = int.MinValue;
            foreach (Position p in posList)
            {
                if (rowMin > p.RowNum) rowMin = p.RowNum;
                if (rowMax < p.RowNum) rowMax = p.RowNum;
                if (colMin > p.ColNum) colMin = p.ColNum;
                if (colMax < p.ColNum) colMax = p.ColNum;
            }
            int rows = rowMax - rowMin + 1;
            int cols = colMax - colMin + 1;

            dgvPosition.Rows.Clear();
            dgvPosition.ColumnCount = cols;
            dgvPosition.RowCount = rows;

            foreach (Position p in posList)
            {
                DataGridViewCell cell = dgvPosition.Rows[p.RowNum - rowMin].Cells[p.ColNum - colMin];
                cell.Value = p;
                this.EnableCell(cell, CanCellSelect(p));
                cell.ToolTipText = p.PositionTypeName;
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.selCusTypeName = this.comboBox1.Text;
        }

        private void EnableCell(DataGridViewCell dc, bool enabled)
        {
            //toggle read-only state
            dc.ReadOnly = !enabled;
            if (enabled)
            {
                //restore cell style to the default value
                dc.Style.BackColor = dc.OwningColumn.DefaultCellStyle.BackColor;
                dc.Style.ForeColor = dc.OwningColumn.DefaultCellStyle.ForeColor;
            }
            else
            {
                //gray out the cell
                dc.Style.BackColor = Color.LightGray;
                dc.Style.ForeColor = Color.DarkGray;
            }
        }


        private void dgvPosition_SelectionChanged(object sender, EventArgs e)
        {

            this.selPositions = this.dgvPosition.SelectedCells
                .OfType<DataGridViewCell>().Where(x => this.CanCellSelect(x))
                  .Select(c => c.Value as Position).ToList();
        }

        private void dgvPosition_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewCell cell = this.dgvPosition.Rows[e.RowIndex].Cells[e.ColumnIndex];
            if (!this.CanCellSelect(cell))
            {
                MessageBox.Show("请选择其他座位！");
                this.dgvPosition.ClearSelection();
                this.dgvPosition.CurrentCell = null;
            }
        }
    }
}


