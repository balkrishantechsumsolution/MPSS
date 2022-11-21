function md5auth(seed) {
    var password = document.getElementById("Password").value;
    if (password != "") {
      //  var md1_password = hex_hmac_md5(password).toUpperCase();
        var hash = hex_md5(password);
        document.getElementById("Password").value = hash;

        return true;
    }
}