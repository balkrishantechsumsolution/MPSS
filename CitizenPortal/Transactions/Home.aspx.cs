using System.Security.Cryptography;
using Encryption.AES;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.Transactions
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btns_Click(object sender, EventArgs e)
        {
            string txnagId = (!String.IsNullOrEmpty(ag_id.Items[ag_id.SelectedIndex].Value)) ? ag_id.Items[ag_id.SelectedIndex].Value : string.Empty;
            string txnmerchantId = (!String.IsNullOrEmpty(me_id.Value)) ? me_id.Value : string.Empty;
            string txnmerchantKey = (!String.IsNullOrEmpty(me_key.Value)) ? me_key.Value : string.Empty;

            string txnorderNumber = (!String.IsNullOrEmpty(order_no.Value)) ? order_no.Value : string.Empty;
            string txnAmount = (!String.IsNullOrEmpty(amount.Value)) ? amount.Value : string.Empty;
            string txnCountry = (!String.IsNullOrEmpty(country.Items[country.SelectedIndex].Value)) ? country.Items[country.SelectedIndex].Value : string.Empty;
            string txnCountryCurrency = (!String.IsNullOrEmpty(currency.Value)) ? currency.Value : string.Empty;
            string txnType = (!String.IsNullOrEmpty(txn_type.Value)) ? txn_type.Value : string.Empty;
            string txnsuccessUrl = (!String.IsNullOrEmpty(success_url.Value)) ? success_url.Value : string.Empty;
            string txnfailureUrl = (!String.IsNullOrEmpty(failure_url.Value)) ? failure_url.Value : string.Empty;
            string txnChannel = (!String.IsNullOrEmpty(channel.Value)) ? channel.Value : string.Empty;



            string pgId = (!String.IsNullOrEmpty(pg_id.Value)) ? pg_id.Value : string.Empty;
            string pgPayMode = (!String.IsNullOrEmpty(paymode.Items[paymode.SelectedIndex].Value)) ? paymode.Items[paymode.SelectedIndex].Value : string.Empty;
            string pgscheme = (!String.IsNullOrEmpty(scheme.Value)) ? scheme.Value : string.Empty;
            string pgEmiMonths = (!String.IsNullOrEmpty(emi_months.Value)) ? emi_months.Value : string.Empty;

            string ccCardNo = (!String.IsNullOrEmpty(card_no.Value)) ? card_no.Value : string.Empty;
            string ccExpMonth = (!String.IsNullOrEmpty(exp_month.Items[exp_month.SelectedIndex].Value)) ? exp_month.Items[exp_month.SelectedIndex].Value : string.Empty;
            string ccexpYear = (!String.IsNullOrEmpty(exp_year.Items[exp_year.SelectedIndex].Value)) ? exp_year.Items[exp_year.SelectedIndex].Value : string.Empty;
            string ccCardName = (!String.IsNullOrEmpty(card_name.Value)) ? card_name.Value : string.Empty;
            string ccCvv2 = (!String.IsNullOrEmpty(cvv2.Value)) ? cvv2.Value : string.Empty;

            string custName = (!String.IsNullOrEmpty(cust_name.Value)) ? cust_name.Value : string.Empty;
            string custEmailId = (!String.IsNullOrEmpty(email_id.Value)) ? email_id.Value : string.Empty;
            string custMobileNo = (!String.IsNullOrEmpty(mobile_no.Value)) ? mobile_no.Value : string.Empty;
            string custUniqueId = (!String.IsNullOrEmpty(unique_id.Value)) ? unique_id.Value : string.Empty;
            string custisLoggedIn = (!String.IsNullOrEmpty(is_logged_in.Items[is_logged_in.SelectedIndex].Value)) ? is_logged_in.Items[is_logged_in.SelectedIndex].Value : string.Empty;



            string billAddress = (!String.IsNullOrEmpty(bill_address.Value)) ? bill_address.Value : string.Empty;
            string billCity = (!String.IsNullOrEmpty(bill_city.Value)) ? bill_city.Value : string.Empty;
            string billState = (!String.IsNullOrEmpty(bill_state.Value)) ? bill_state.Value : string.Empty;
            string billCountry = (!String.IsNullOrEmpty(bill_country.Value)) ? bill_country.Value : string.Empty;
            string billZip = (!String.IsNullOrEmpty(bill_zip.Value)) ? bill_zip.Value : string.Empty;



            string shipAddress = (!String.IsNullOrEmpty(ship_address.Value)) ? ship_address.Value : string.Empty;
            string shipCity = (!String.IsNullOrEmpty(ship_city.Value)) ? ship_city.Value : string.Empty;
            string shipState = (!String.IsNullOrEmpty(ship_state.Value)) ? ship_state.Value : string.Empty;
            string shipCountry = (!String.IsNullOrEmpty(ship_country.Value)) ? ship_country.Value : string.Empty;
            string shipZip = (!String.IsNullOrEmpty(ship_zip.Value)) ? ship_zip.Value : string.Empty;
            string shipDays = (!String.IsNullOrEmpty(ship_days.Value)) ? ship_days.Value : string.Empty;
            string shipAddressCount = (!String.IsNullOrEmpty(address_count.Value)) ? address_count.Value : string.Empty;


            string itemCount = (!String.IsNullOrEmpty(item_count.Value)) ? item_count.Value : string.Empty;
            string itemValue = (!String.IsNullOrEmpty(item_value.Value)) ? item_value.Value : string.Empty;
            string itemCategory = (!String.IsNullOrEmpty(item_category.Value)) ? item_category.Value : string.Empty;


            string udf1 = (!String.IsNullOrEmpty(udf_1.Value)) ? udf_1.Value : string.Empty;
            string udf2 = (!String.IsNullOrEmpty(udf_2.Value)) ? udf_2.Value : string.Empty;
            string udf3 = (!String.IsNullOrEmpty(udf_3.Value)) ? udf_3.Value : string.Empty;
            string udf4 = (!String.IsNullOrEmpty(udf_4.Value)) ? udf_4.Value : string.Empty;
            string udf5 = (!String.IsNullOrEmpty(udf_5.Value)) ? udf_5.Value : string.Empty;


            string txn_details = txnagId + "|" + txnmerchantId + "|" + txnorderNumber + "|" + txnAmount + "|" + txnCountry + "|" + txnCountryCurrency + "|" + txnType + "|" + txnsuccessUrl + "|" + txnfailureUrl + "|" + txnChannel;
            string pg_details = pgId + "|" + pgPayMode + "|" + pgscheme + "|" + pgEmiMonths;
            string card_details = ccCardNo + "|" + ccExpMonth + "|" + ccexpYear + "|" + ccCvv2 + "|" + ccCardName;
            string cust_details = custName + "|" + custEmailId + "|" + custMobileNo + "|" + custUniqueId + "|" + custisLoggedIn;
            string bill_details = billAddress + "|" + billCity + "|" + billState + "|" + billCountry + "|" + billZip;
            string ship_details = shipAddress + "|" + shipCity + "|" + shipState + "|" + shipCountry + "|" + shipZip + "|" + shipDays + "|" + shipAddressCount;
            string item_details = itemCount + "|" + itemValue + "|" + itemCategory;
            string other_details = udf1 + "|" + udf2 + "|" + udf3 + "|" + udf4 + "|" + udf5;

            MyCryptoClass aes = new MyCryptoClass();
            string enc_txn_details = aes.encrypt(txn_details);
            string enc_pg_details = aes.encrypt(pg_details);
            string enc_card_details = aes.encrypt(card_details);
            string enc_cust_details = aes.encrypt(cust_details);
            string enc_bill_details = aes.encrypt(bill_details);
            string enc_ship_details = aes.encrypt(ship_details);
            string enc_item_details = aes.encrypt(item_details);
            string enc_other_details = aes.encrypt(other_details);


            NameValueCollection data = new NameValueCollection();
            data.Add("me_id", txnmerchantId);
            data.Add("txn_details", enc_txn_details);
            data.Add("pg_details", enc_pg_details);
            data.Add("card_details", enc_card_details);
            data.Add("cust_details", enc_cust_details);
            data.Add("bill_details", enc_bill_details);
            data.Add("ship_details", enc_ship_details);
            data.Add("item_details", enc_item_details);
            data.Add("other_details", enc_other_details);
            HttpHelper.RedirectAndPOST(this.Page, "https://pguat.safexpay.com/agcore/payment/", data);
        }
    }
}