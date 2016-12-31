﻿using DAL;
using Model;
using System.Collections.Generic;

namespace BLL
{
    public class PositionBLL
    {
        private PositionDAL dal = new PositionDAL();
        public List<Position> GetAllPosition()
        {
            return dal.GetAllFromSqlServer();
        }
        public int AddPosition(Position position)
        {
            return dal.Insert(position);
        }
        public void DropPosition(int id)
        {
            dal.Update(id, false);
        }
        public void EnablePosition(int id)
        {
            dal.Update(id, true);
        }
        public void ChangePositionType(int id, byte typeId)
        {
            dal.Update(id, typeId);
        }

        public List<Position> Search(byte typeId)
        {
            return dal.Search(typeId);
        }
    }
}