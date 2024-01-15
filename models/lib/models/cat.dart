/// Cats, from [CFA](https://cfa.org/breeds/)
///
/// ```js
/// const links = document.querySelectorAll("a.elementor-button-link.elementor-button.elementor-size-sm");
/// Array.from(links).map((e)=>e.href.replace('https://cfa.org/','').replace('/','').replace(/-\w/g, (match) =>match[1].toUpperCase())).slice(2);
///
///
/// ```
enum Cat {
  abyssinian,
  americanBobtail,
  americanCurl,
  americanShorthair,
  americanWirehair,
  balinese,
  bengal,
  birman,
  bombay,
  britishShorthair,
  burmese,
  burmilla,
  chartreux,
  colorpointShorthair,
  cornishRex,
  devonRex,
  egyptianMau,
  europeanBurmese,
  exotic,
  havanaBrown,
  japaneseBobtail,
  khaoManee,
  korat,
  laperm,
  lykoi,
  maineCoonCat,
  manx,
  norwegianForestCat,
  ocicat,
  oriental,
  persian,
  ragamuffin,
  ragdoll,
  russianBlue,
  scottishFold,
  selkirkRex,
  siamese,
  siberian,
  singapura,
  somali,
  sphynx,
  tonkinese,
  toybob,
  turkishAngora,
  turkishVa,
  others;
}