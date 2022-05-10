function search(e, t) {
    if(e.keyCode == 13) {
        var mydrug = t.value.charAt(0).toUpperCase() + t.value.slice(1);
        mydrug = mydrug.trim();
        if (mydrug == "") {
            return;
        }
        else {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
              if (this.readyState == 4 && this.status == 200) {
                // Convert the result string back into an array
                results = (this.responseText).split("/n");
                //alert(results);
                if (results[0] == "Error") {
                  return;
                }
                var drug = document.getElementById('drug');
                var drugBrand = document.getElementById('drugBrand');
                var drugImage = document.getElementById('drugImage');
                //var drugLink = document.createElement('a') //<a class="druglink"></a>
                var drugUse = document.getElementById('drugUse');
                var drugDesc = document.getElementById('drugDesc');

                var drugName = results[0],
                mydrug = results[1],
                brandType = results[2],
                drugCompliment = "Other Drug",
                usage = results[3],
                desc = results[4];
                //var link = document.createTextNode(drugCompliment)
                
                document.title = "Rxpedia - " + mydrug
                drug.innerHTML = mydrug;
                drugImage.src = "../images/" + drugName + ".png"
                drugBrand.innerHTML = brandType + " " + drugName;
                drugUse.innerHTML = usage;
                drugDesc.innerHTML = desc;
              }
            }; // end xml
            xmlhttp.open("GET", "../scripts/connect.php?q=" + mydrug, true);
            xmlhttp.send();
        }// end mydrug not empty
    }// end Enter key pressed
};// end js

