function price() {
  const calc = document.getElementById("item-price")
  
  calc.addEventListener('change', function(){
  const value1 = calc.value;
  const fee = value1 * 0.1;
  const profit = value1 - fee;

  const tax = document.getElementById("add-tax-price");
  tax.innerHTML = fee.toLocaleString();
  const profit1 = document.getElementById("profit");
  profit1.innerHTML = profit.toLocaleString()
  
  })
}





window.addEventListener("load",price)

