bool isXwin = false;
bool isOwin = false;
bool WillXplay = true;
List<String> Game = ['', '', '', '', '', '', '', '', ''];
void Check(String e) {
  if (Game[0] == e && Game[1] == e && Game[2] == e ||
      Game[3] == e && Game[4] == e && Game[5] == e ||
      Game[6] == e && Game[7] == e && Game[8] == e ||
      Game[0] == e && Game[3] == e && Game[6] == e ||
      Game[1] == e && Game[4] == e && Game[7] == e ||
      Game[2] == e && Game[5] == e && Game[8] == e ||
      Game[0] == e && Game[4] == e && Game[8] == e ||
      Game[2] == e && Game[4] == e && Game[6] == e) {
    if (e == 'O') {
      isOwin = true;
    } else {
      isXwin = true;
    }
  }
}


