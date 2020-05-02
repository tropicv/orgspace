<?

class repl {
    var $code;
    var $unicode;  

    function repl($code,$unicode=-1){
      $this->code=$code;
      if($unicode==-1) $this->unicode=$this->code;
      else $this->unicode=$unicode;
    }

    function getucode(){ return "&#".$this->unicode.";"; }
    function getcode(){ return chr($this->code); }

};

$pt = Array(
        new repl(ord('"'), 34),
        new repl(39, 39),
        new repl(ord('&'), 38),
        new repl(ord('>'), 62),
        new repl(ord('<'), 60),
        new repl(10, 10),
        new repl(13, 13),
        new repl(92, 92),
        new repl(151, 151),
        new repl(169, 169),
        new repl(171, 171),
        new repl(174, 174),
        new repl(175, 175),
        new repl(180, 180),
        new repl(183, 183), // middle dot
        new repl(187, 187),
        new repl(153, 8482),
/*        new repl(150, 8211), // &ndash;
        new repl(146, 8217),

        new repl(215, 215), // multiplication sign
        new repl(233, 233),
        new repl(8211, 8211),
        new repl(8212, 8212),
        new repl(8216, 8216),
        new repl(8217, 8217),
        new repl(8230, 8230),
        new repl(8242, 8242),
        new repl(8243, 8243),
        new repl(8482, 8482),*/

/*        new repl(160),
        new repl(161),
        new repl(162),
        new repl(163),
        new repl(164),
        new repl(165),
        new repl(166),
        new repl(167),
        new repl(176),
        new repl(177),
        new repl(181),
        new repl(182),
        new repl(188),
        new repl(189),
        new repl(190),
        new repl(191),
        new repl(247),

        new repl(402),
        new repl(710),
        new repl(732),
        new repl(913),
        new repl(914),
        new repl(915),
        new repl(916),
        new repl(917),
        new repl(918),
        new repl(919),
        new repl(920),
        new repl(921),
        new repl(922),
        new repl(923),
        new repl(924),
        new repl(925),
        new repl(926),
        new repl(927),
        new repl(928),
        new repl(929),
        new repl(931),
        new repl(932),
        new repl(933),
        new repl(934),
        new repl(935),
        new repl(936),
        new repl(937),
        new repl(945),
        new repl(946),
        new repl(947),
        new repl(948),
        new repl(949),
        new repl(950),
        new repl(951),
        new repl(952),
        new repl(953),
        new repl(954),
        new repl(955),
        new repl(956),
        new repl(957),
        new repl(958),
        new repl(959),
        new repl(960),
        new repl(961),
        new repl(962),
        new repl(963),
        new repl(964),
        new repl(965),
        new repl(966),
        new repl(967),
        new repl(968),
        new repl(969),
        new repl(8220),
        new repl(8221),
        new repl(8222),
        new repl(8226),
        new repl(8254),
        new repl(8364),
        new repl(8482),
        new repl(9674),
        new repl(9675),
        new repl(8592),
        new repl(8593),
        new repl(8594),
        new repl(8595),
        new repl(8596),
        new repl(8597) */
    );

    /**
     * chaning special chars from input string (for xml output), using patt array
     *
     * @param inp - String to be chaning
     * @return Result String
     */


    function chars_filter($inp) {
        global $pt;

        $outp = "";

        for ($i = 0; $i < strlen($inp); $i++) {

            if (($i < strlen($inp) - 2) && substr($inp,$i,2)=="&#") {
                $code = "&#";
                for ($x = 0; ctype_digit($inp{$i+2+$x}) && $x < 6; $x++) {
                    $code .= $inp{$i+2+$x};
                }

                if ($inp{$i+$x+2} == ';') {
                    $code .= ";";


                    for ($j = 0; $j < sizeof($pt); $j++) {
                        $plen = strlen($pt[$j]->getucode());

                        if ($code==$pt[$j]->getucode()) {
                            break;
                        }
                    }
                    if ($j < sizeof($pt)) {
                        $i += strlen($pt[$j]->getucode()) - 1;
                        $outp.=$pt[$j]->getucode();
                        continue;
                    }
                }
            }

            for ($j = 0; $j < sizeof($pt); $j++) {

                if ($inp[$i] == $pt[$j]->getcode()) {
                    $outp.=$pt[$j]->getucode();
                    break;
                }
            }
            if ($j == sizeof($pt)) $outp.=$inp[$i];
        }
        return $outp;
    }


function make_seed() {
    list($usec, $sec) = explode(' ', microtime());
    return (float) $sec + ((float) $usec * 100000);
}

function remove($options,$key){
     reset($options);
     $res=""; 
     while (list($keyname, $val) = each($options)) {
         if($key!=$keyname) $res[$keyname]=$val;
     }
     return $res;
}

function clone_obj($obj){ return clone $obj; }

function form_to_db($title,$body){
     $fs=new formstorage_db();
     $fs->create_default();
     $fs->setf("form",$title); 
     $fs->setf("body",chars_filter($body)); 
     $fs->insert();
}

?>