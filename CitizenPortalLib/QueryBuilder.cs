using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Reflection;
using System.Data.Common;


namespace CitizenPortalLib
{



    /// <summary>
    /// Uses .NET reflection to generate commands to insert into or update DB tables given array of column names and a structure
    /// </summary>
    public class QueryBuilder
    {
        /// <summary>
        /// Generates INSERT statement for given table.
        /// It includes columns specified in the fields array in the INSERT statement
        /// and fetches values from the object passed
        /// </summary>
        /// <param name="dataObject">Entity object containing values to be inserted</param>
        /// <param name="table">Table name</param>
        /// <param name="fields">Column names to include in INSERT statement</param>
        /// <returns>DBCommand object</returns>
        public DbCommand GetInsertCommand(object dataObject, string table, string[] fields)
        {
            try
            {
                #region Generate INSERT

                string insertStatement = GenerateInsertQuery(dataObject, table, fields);

                SqlCommand sqlInsertCommand = new SqlCommand();
                sqlInsertCommand.CommandType = CommandType.Text;
                sqlInsertCommand.CommandText = insertStatement;

                #endregion

                PopulateParameters(dataObject, sqlInsertCommand, fields);
                return sqlInsertCommand;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Generates INSERT statement for given table.
        /// It includes columns specified in the fields array in the INSERT statement
        /// and fetches values from the object passed
        /// </summary>
        /// <param name="dataObject">Entity object containing values to be inserted</param>
        /// <param name="table">Table name</param>
        /// <param name="fields">Column names to include in INSERT statement</param>
        /// <returns>DBCommand object</returns>
        public DbCommand GetInsertCommandV3(object dataObject, string SPName, string[] fields)
        {
            try
            {
                #region Generate Stored Procedure Parameters  

                SqlCommand sqlInsertCommand = new SqlCommand();
                sqlInsertCommand.CommandType = CommandType.StoredProcedure;
                sqlInsertCommand.CommandText = SPName;

                #endregion

                PopulateParameters(dataObject, sqlInsertCommand, fields);
                return sqlInsertCommand;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Generates INSERT statement for given table.
        /// It includes columns specified in the fields array in the INSERT statement
        /// and fetches values from the object passed
        /// </summary>
        /// <param name="dataObject">Entity object containing values to be inserted</param>
        /// <param name="table">Table name</param>
        /// <param name="fields">Column names to include in INSERT statement</param>
        /// <returns>DBCommand object</returns>
        public DbCommand GetInsertCommandV2(object dataObject, string table, string[] fields)
        {
            try
            {
                #region Generate INSERT

                string insertStatement = GenerateInsertQuery(dataObject, table, fields);

                SqlCommand sqlInsertCommand = new SqlCommand();
                sqlInsertCommand.CommandType = CommandType.Text;
                sqlInsertCommand.CommandText = insertStatement;

                #endregion

                PopulateParametersV2(dataObject, sqlInsertCommand, fields);
                return sqlInsertCommand;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Formulates the INSERT statement based on parameters passed
        /// </summary>
        /// <param name="dataObject">Entity object containing values to be inserted</param>
        /// <param name="table">Table name</param>
        /// <param name="fields">Column names to include in INSERT statement</param>
        /// <returns>INSERT statement</returns>
        private string GenerateInsertQuery(object dataObject, string table, string[] fields)
        {
            try
            {
                StringBuilder insertString = new StringBuilder();
                insertString.Append("INSERT INTO ");
                insertString.Append(table);
                insertString.Append("(");

                #region Values
                int fieldCtr = 0;
                StringBuilder valString = new StringBuilder();

                Type structType = dataObject.GetType();
                FieldInfo member;

                for (fieldCtr = 0; fieldCtr < fields.Length; fieldCtr++)
                {
                    member = structType.GetField(fields[fieldCtr]);
                    object objFieldValue = member.GetValue(dataObject);

                    if (objFieldValue == null)
                    {
                        continue;
                    }

                    if (fieldCtr > 0)
                    {
                        insertString.Append(",");
                        valString.Append(",");
                    }

                    insertString.Append(fields[fieldCtr]);
                    valString.Append("@" + fields[fieldCtr]);
                    //valString.Append(objFieldValue.ToString());
                }

                insertString.Append(") VALUES (");
                insertString.Append(valString.ToString());
                insertString.Append(")");

                #endregion

                return insertString.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Generates UPDATE statement for given table.
        /// It includes columns specified in the fields array in the UPDATE statement
        /// and fetches values from the object passed
        /// </summary>
        /// <param name="dataObject">Entity object containing values to be updated</param>
        /// <param name="table">Table name</param>
        /// <param name="fields">Column names to include in UPDATE statement</param>
        /// <param name="keyColumns"></param>
        /// <returns></returns>
        public DbCommand GetUpdateCommand(object dataObject, string table, string[] fields, string[] keyColumns)
        {
           
                #region Generate UPDATE
                string updateStatement = GenerateUpdateQuery(dataObject, table, fields, keyColumns);

                SqlCommand sqlUpdateCommand = new SqlCommand();

                sqlUpdateCommand.CommandType = CommandType.Text;
                sqlUpdateCommand.CommandText = updateStatement;
                #endregion

                PopulateParameters(dataObject, sqlUpdateCommand, fields);
                PopulateParameters(dataObject, sqlUpdateCommand, keyColumns);
                return sqlUpdateCommand;
           
        }

        /// <summary>
        /// Generates UPDATE statement for given table.
        /// It includes columns specified in the fields array in the UPDATE statement
        /// and fetches values from the object passed
        /// </summary>
        /// <param name="dataObject">Entity object containing values to be updated</param>
        /// <param name="table">Table name</param>
        /// <param name="fields">Column names to include in UPDATE statement</param>
        /// <param name="keyColumns"></param>
        /// <returns></returns>
        public DbCommand GetUpdateCommandV2(object dataObject, string table, string[] fields, string[] keyColumns)
        {

            #region Generate UPDATE
            string updateStatement = GenerateUpdateQuery(dataObject, table, fields, keyColumns);

            SqlCommand sqlUpdateCommand = new SqlCommand();

            sqlUpdateCommand.CommandType = CommandType.Text;
            sqlUpdateCommand.CommandText = updateStatement;
            #endregion

            PopulateParametersV2(dataObject, sqlUpdateCommand, fields);
            PopulateParametersV2(dataObject, sqlUpdateCommand, keyColumns);
            return sqlUpdateCommand;

        }

        /// <summary>
        /// Formulates the UPDATE statement based on parameters passed
        /// </summary>
        /// <param name="dataObject">Entity object containing values to be updated</param>
        /// <param name="table">Table name</param>
        /// <param name="fields">Column names to include in UPDATE statement</param>
        /// <param name="keyColumns"></param>
        /// <returns></returns>
        private string GenerateUpdateQuery(object dataObject, string table, string[] fields, string[] keyColumns)
        {
            try
            {
                StringBuilder updateString = new StringBuilder();
                updateString.Append("UPDATE ");
                updateString.Append(table);
                updateString.Append(" SET ");

                #region Values
                int fieldCtr = 0;

                Type structType = dataObject.GetType();
                FieldInfo member;

                for (fieldCtr = 0; fieldCtr < fields.Length; fieldCtr++)
                {
                    member = structType.GetField(fields[fieldCtr]);
                    object objFieldValue = member.GetValue(dataObject);

                    //if (objFieldValue == null)
                    //{
                    //    continue;
                    //}

                    if (fieldCtr > 0)
                    {
                        updateString.Append(",");
                    }

                    updateString.Append(fields[fieldCtr]);
                    updateString.Append(" = @" + fields[fieldCtr]);
                    //updateString.Append(" = " + objFieldValue.ToString());

                    //if (fieldCtr < (fields.Length - 1))
                    //{
                    //    updateString.Append(",");
                    //}
                }

                updateString.Append(" WHERE ");
                for (fieldCtr = 0; fieldCtr < keyColumns.Length; fieldCtr++)
                {
                    member = structType.GetField(keyColumns[fieldCtr]);
                    object objFieldValue = member.GetValue(dataObject);

                    if (objFieldValue == null)
                    {
                        continue;
                    }

                    if (fieldCtr > 0)
                    {
                        updateString.Append(" and ");
                    }

                    updateString.Append(keyColumns[fieldCtr]);
                    updateString.Append(" = @" + keyColumns[fieldCtr]);
                    //updateString.Append(" = " + objFieldValue.ToString());

                    //if (fieldCtr < (keyColumns.Length - 1))
                    //{
                    //    updateString.Append(",");
                    //}
                }
                #endregion

                return updateString.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Populates the DBCommand with values
        /// </summary>
        /// <param name="dataObject">Entity object containing values to be inserted/ updated</param>
        /// <param name="dbCommandToPopulate">DBCommand object</param>
        /// <param name="fields">Column names to include in INSERT/ UPDATE statement</param>
        private void PopulateParameters(object dataObject, DbCommand dbCommandToPopulate, string[] fields)
        {
            try
            {
                #region CreateParams and Set Value

                Type structType = dataObject.GetType();

                //object aMember = structType.GetMember(AFieldNames[0]);

                int fieldCounter = 0;

                object objVal; //value of the field cast as object

                for (fieldCounter = 0; fieldCounter < fields.Length; fieldCounter++)
                {
                    FieldInfo member = structType.GetField(fields[fieldCounter], BindingFlags.IgnoreCase | BindingFlags.Public | BindingFlags.Instance);

                    objVal = System.DBNull.Value; // initialize to null

                    object objFieldValue = member.GetValue(dataObject);

                    //if (objFieldValue == null)
                    //{
                    //    continue;
                    //}

                    #region FieldType Switch

                    #region int
                    if (member.FieldType == typeof(int?))
                    {
                        int? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (int?)objFieldValue;
                            objVal = fieldValue.Value;
                        }

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Int);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }

                    else if (member.FieldType == typeof(int))
                    {
                        int fieldValue;

                        fieldValue = (int)objFieldValue;
                        objVal = fieldValue;

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Int);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region long
                    if (member.FieldType == typeof(long?))
                    {
                        long? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (long?)objFieldValue;
                            objVal = fieldValue.Value;
                        }

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.BigInt);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }

                    else if (member.FieldType == typeof(long))
                    {
                        long fieldValue;

                        fieldValue = (long)objFieldValue;
                        objVal = fieldValue;

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.BigInt);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region double
                    else if (member.FieldType == typeof(float?))
                    {
                        float? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (float?)objFieldValue;
                            objVal = fieldValue.Value;
                        }

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Float);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }

                    else if (member.FieldType == typeof(float))
                    {
                        float fieldValue;
                        fieldValue = (float)objFieldValue;
                        objVal = fieldValue;

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Float);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region double
                    else if (member.FieldType == typeof(double?))
                    {
                        double? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (double?)objFieldValue;
                            objVal = fieldValue.Value;
                        }
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Decimal);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }

                    else if (member.FieldType == typeof(double))
                    {
                        double fieldValue;
                        fieldValue = (double)objFieldValue;
                        objVal = fieldValue;
                        //SqlCommandToPopulate.Parameters.Add("@" + AFieldNames[fieldCounter],fieldValue);
                        //System.Windows.Forms.MessageBox.Show(nIntOut.Value.ToString());
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Decimal);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion
                    #region decimal
                    else if (member.FieldType == typeof(decimal?))
                    {
                        decimal? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (decimal?)objFieldValue;
                            objVal = fieldValue.Value;
                        }
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Decimal);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }

                    else if (member.FieldType == typeof(decimal))
                    {
                        decimal fieldValue;
                        fieldValue = (decimal)objFieldValue;
                        objVal = fieldValue;
                        //SqlCommandToPopulate.Parameters.Add("@" + AFieldNames[fieldCounter],fieldValue);
                        //System.Windows.Forms.MessageBox.Show(nIntOut.Value.ToString());
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Decimal);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion
                    #region datetime
                    else if (member.FieldType == typeof(DateTime?))
                    {
                        DateTime? fieldValue;


                        if (objFieldValue != null)
                        {
                            fieldValue = (DateTime?)objFieldValue;
                            objVal = fieldValue.Value;
                        }
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.DateTime);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }

                    else if (member.FieldType == typeof(DateTime))
                    {
                        DateTime fieldValue;
                        fieldValue = (DateTime)objFieldValue;
                        objVal = fieldValue;
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.DateTime);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region bytearray
                    else if (member.FieldType == typeof(Byte[]))
                    {
                        byte[] fieldValue;
                        fieldValue = (byte[])objFieldValue;
                        if (fieldValue != null)
                            objVal = fieldValue;
                        //System.Windows.Forms.MessageBox.Show(nIntOut.Value.ToString());
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Image);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region string
                    else if (member.FieldType == typeof(string))
                    {
                        string fieldValue;
                        fieldValue = (string)objFieldValue;
                        if (fieldValue != null)
                        {
                            objVal = fieldValue;
                        }

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.NVarChar);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region bool
                    else if (member.FieldType == typeof(bool?))
                    {
                        bool? fieldValue;
                        if (objFieldValue != null)
                        {
                            fieldValue = (bool?)objFieldValue;
                            objVal = fieldValue.Value;
                            if ((bool?)objVal == true)
                            {
                                objVal = 1;
                            }
                            else
                            {
                                objVal = 0;
                            }
                        }

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Bit);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    else if (member.FieldType == typeof(bool))
                    {
                        bool fieldValue;
                        fieldValue = (bool)objFieldValue;

                        if (fieldValue == true)
                        {
                            objVal = 1;
                        }
                        else
                        {
                            objVal = 0;
                        }
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Bit);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;

                    }

                    #endregion
                    #endregion switch
                }

                #endregion
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Populates the DBCommand with values
        /// </summary>
        /// <param name="dataObject">Entity object containing values to be inserted/ updated</param>
        /// <param name="dbCommandToPopulate">DBCommand object</param>
        /// <param name="fields">Column names to include in INSERT/ UPDATE statement</param>
        private void PopulateParametersV2(object dataObject, DbCommand dbCommandToPopulate, string[] fields)
        {
            try
            {
                #region CreateParams and Set Value

                Type structType = dataObject.GetType();

                //object aMember = structType.GetMember(AFieldNames[0]);

                int fieldCounter = 0;

                object objVal; //value of the field cast as object

                for (fieldCounter = 0; fieldCounter < fields.Length; fieldCounter++)
                {
                    FieldInfo member = structType.GetField(fields[fieldCounter]);

                    objVal = System.DBNull.Value; // initialize to null

                    object objFieldValue = member.GetValue(dataObject);

                    //if (objFieldValue == null)
                    //{
                    //    continue;
                    //}

                    #region FieldType Switch

                    #region int
                    if (member.FieldType == typeof(int?))
                    {
                        int? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (int?)objFieldValue;
                            objVal = fieldValue.Value;
                        }

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Int);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }

                    else if (member.FieldType == typeof(int))
                    {
                        int fieldValue;

                        fieldValue = (int)objFieldValue;
                        objVal = fieldValue;

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Int);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region long
                    if (member.FieldType == typeof(long?))
                    {
                        long? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (long?)objFieldValue;
                            objVal = fieldValue.Value;
                        }

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.BigInt);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }

                    else if (member.FieldType == typeof(long))
                    {
                        long fieldValue;

                        fieldValue = (long)objFieldValue;
                        objVal = fieldValue;

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.BigInt);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region double
                    else if (member.FieldType == typeof(float?))
                    {
                        float? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (float?)objFieldValue;
                            objVal = fieldValue.Value;
                        }

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Float);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }

                    else if (member.FieldType == typeof(float))
                    {
                        float fieldValue;
                        fieldValue = (float)objFieldValue;
                        objVal = fieldValue;

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Float);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region double
                    else if (member.FieldType == typeof(double?))
                    {
                        double? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (double?)objFieldValue;
                            objVal = fieldValue.Value;
                        }
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Decimal);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }

                    else if (member.FieldType == typeof(double))
                    {
                        double fieldValue;
                        fieldValue = (double)objFieldValue;
                        objVal = fieldValue;
                        //SqlCommandToPopulate.Parameters.Add("@" + AFieldNames[fieldCounter],fieldValue);
                        //System.Windows.Forms.MessageBox.Show(nIntOut.Value.ToString());
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Decimal);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region datetime
                    else if (member.FieldType == typeof(DateTime?))
                    {
                        DateTime? fieldValue;


                        if (objFieldValue != null)
                        {
                            fieldValue = (DateTime?)objFieldValue;
                            objVal = fieldValue.Value;
                        }
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.DateTime);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }

                    else if (member.FieldType == typeof(DateTime))
                    {
                        DateTime fieldValue;
                        fieldValue = (DateTime)objFieldValue;
                        objVal = fieldValue;
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.DateTime);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region bytearray
                    else if (member.FieldType == typeof(Byte[]))
                    {
                        byte[] fieldValue;
                        fieldValue = (byte[])objFieldValue;
                        if (fieldValue != null)
                            objVal = fieldValue;
                        //System.Windows.Forms.MessageBox.Show(nIntOut.Value.ToString());
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Image);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region string
                    else if (member.FieldType == typeof(string))
                    {
                        string fieldValue;
                        fieldValue = (string)objFieldValue;
                        if (fieldValue != null)
                        {
                            objVal = fieldValue;
                        }

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.VarChar);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    #endregion

                    #region bool
                    else if (member.FieldType == typeof(bool?))
                    {
                        bool? fieldValue;
                        if (objFieldValue != null)
                        {
                            fieldValue = (bool?)objFieldValue;
                            objVal = fieldValue.Value;
                            if ((bool?)objVal == true)
                            {
                                objVal = 1;
                            }
                            else
                            {
                                objVal = 0;
                            }
                        }

                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Bit);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;
                    }
                    else if (member.FieldType == typeof(bool))
                    {
                        bool fieldValue;
                        fieldValue = (bool)objFieldValue;

                        if (fieldValue == true)
                        {
                            objVal = 1;
                        }
                        else
                        {
                            objVal = 0;
                        }
                        SqlParameter param = new SqlParameter("@" + fields[fieldCounter], SqlDbType.Bit);
                        dbCommandToPopulate.Parameters.Add(param);
                        dbCommandToPopulate.Parameters["@" + fields[fieldCounter]].Value = objVal;

                    }

                    #endregion
                    #endregion switch
                }

                #endregion
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Generates INSERT statement for audit tables
        /// </summary>
        /// <param name="dataObject">Entity object containing values to be inserted</param>
        /// <param name="table">Table name</param>
        /// <param name="fields">Column names to include in INSERT statement</param>
        /// <returns></returns>
        public string GenerateAuditInsertQuery(object dataObject, string table, string[] fields)
        {
            try
            {
                StringBuilder insertString = new StringBuilder();
                insertString.Append("INSERT INTO ");
                insertString.Append(table + "_Audit");
                insertString.Append("(");

                int fieldCtr = 0;
                StringBuilder valString = new StringBuilder();

                for (fieldCtr = 0; fieldCtr < fields.Length; fieldCtr++)
                {
                    insertString.Append(fields[fieldCtr]);
                    //valString.Append("@" + fields[fieldCtr]);

                    if (fieldCtr < (fields.Length - 1))
                    {
                        insertString.Append(",");
                        //valString.Append(",");
                    }
                }

                #region "Get values"

                Type structType = dataObject.GetType();

                int fieldCounter = 0;

                object objVal; //value of the field cast as object

                for (fieldCounter = 0; fieldCounter < fields.Length; fieldCounter++)
                {
                    FieldInfo member = structType.GetField(fields[fieldCounter]);

                    objVal = System.DBNull.Value; // initialize to null

                    object objFieldValue = member.GetValue(dataObject);

                    #region FieldType Switch

                    #region int
                    if (member.FieldType == typeof(int?))
                    {
                        int? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (int?)objFieldValue;
                            objVal = fieldValue.Value;
                        }

                        valString.Append(objVal + ",");

                    }

                    else if (member.FieldType == typeof(int))
                    {
                        int fieldValue;

                        fieldValue = (int)objFieldValue;
                        objVal = fieldValue;

                        valString.Append(objVal + ",");
                    }
                    #endregion

                    #region long
                    if (member.FieldType == typeof(long?))
                    {
                        long? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (long?)objFieldValue;
                            objVal = fieldValue.Value;
                        }

                        valString.Append(objVal + ",");
                    }

                    else if (member.FieldType == typeof(long))
                    {
                        long fieldValue;

                        fieldValue = (long)objFieldValue;
                        objVal = fieldValue;

                        valString.Append(objVal + ",");
                    }
                    #endregion

                    #region double
                    else if (member.FieldType == typeof(float?))
                    {
                        float? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (float?)objFieldValue;
                            objVal = fieldValue.Value;
                        }
                        valString.Append(objVal + ",");
                    }

                    else if (member.FieldType == typeof(float))
                    {
                        float fieldValue;
                        fieldValue = (float)objFieldValue;
                        objVal = fieldValue;

                        valString.Append(objVal + ",");
                    }
                    #endregion

                    #region double
                    else if (member.FieldType == typeof(double?))
                    {
                        double? fieldValue;

                        if (objFieldValue != null)
                        {
                            fieldValue = (double?)objFieldValue;
                            objVal = fieldValue.Value;
                        }
                        valString.Append(objVal + ",");
                    }

                    else if (member.FieldType == typeof(double))
                    {
                        double fieldValue;
                        fieldValue = (double)objFieldValue;
                        objVal = fieldValue;

                        valString.Append(objVal + ",");
                    }
                    #endregion

                    #region datetime
                    else if (member.FieldType == typeof(DateTime?))
                    {
                        DateTime? fieldValue;


                        if (objFieldValue != null)
                        {
                            fieldValue = (DateTime?)objFieldValue;
                            objVal = fieldValue.Value;
                        }
                        valString.Append(objVal + ",");
                    }

                    else if (member.FieldType == typeof(DateTime))
                    {
                        DateTime fieldValue;
                        fieldValue = (DateTime)objFieldValue;
                        objVal = fieldValue;

                        valString.Append(objVal + ",");
                    }
                    #endregion

                    #region bytearray
                    else if (member.FieldType == typeof(Byte[]))
                    {
                        byte[] fieldValue;
                        fieldValue = (byte[])objFieldValue;
                        if (fieldValue != null)
                            objVal = fieldValue;

                        valString.Append(objVal + ",");
                    }
                    #endregion

                    #region string
                    else if (member.FieldType == typeof(string))
                    {
                        string fieldValue;
                        fieldValue = (string)objFieldValue;
                        if (fieldValue != null)
                            objVal = fieldValue;

                        valString.Append(objVal + ",");
                    }
                    #endregion

                    #region bool
                    else if (member.FieldType == typeof(bool?))
                    {
                        bool? fieldValue;
                        if (objFieldValue != null)
                        {
                            fieldValue = (bool?)objFieldValue;
                            objVal = fieldValue.Value;
                            if ((bool?)objVal == true)
                            {
                                objVal = 1;
                            }
                            else
                            {
                                objVal = 0;
                            }
                        }

                        valString.Append(objVal + ",");
                    }
                    else if (member.FieldType == typeof(bool))
                    {
                        bool fieldValue;
                        fieldValue = (bool)objFieldValue;

                        if (fieldValue == true)
                        {
                            objVal = 1;
                        }
                        else
                        {
                            objVal = 0;
                        }

                        valString.Append(objVal + ",");
                    }

                    #endregion
                }
                    #endregion switch



                #endregion

                insertString.Append(") VALUES (");
                insertString.Append(valString.ToString());
                insertString.Append(")");

                return insertString.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}



