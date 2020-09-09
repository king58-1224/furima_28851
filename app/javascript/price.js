function price() {
  const calc = document.getElementById("item-price")
  
  calc.addEventListener('change', function(){
  const value1 = calc.value;
  const fee = value1 * 0.1;
  const profit = value1 - fee;

  const tax = document.getElementById("add-tax-price");
  tax.innerHTML = fee;
  const profit1 = document.getElementById("profit");
  profit1.innerHTML = profit
  
  })
}





window.addEventListener("load",price)

// ①　JSを動かす記述 OK
// ②　価格を入力するHTMLのクラスかIDを変数Aに入れる
//    document.getElementById

// ③　上記で入れた変数Aに対しての発火条件を書く
//    addEventListener [addeventlistener イベント一覧]

// ④　②の中で入力された値を取り出して変数Bに入れる
// ⑤　変数Bに対して計算し変数C,Dに入れる（出品手数料Cと利益D）

// 金額計算をできるように
// ①入力された値を取得
// ②入力された値から10%を引く計算式
// ③利益計算　①−②

// ⑥　手数料部分には変数Cをインサート
// ⑦　利益部分に変数Dをインサート
// innerHTM、textContentなどで変数を貼り付ける記述をする