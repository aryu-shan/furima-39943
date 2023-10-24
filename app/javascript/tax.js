document.addEventListener('DOMContentLoaded', function() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  if (itemPrice) {
    itemPrice.addEventListener("input", () => {
      // 入力された価格を数値に変換
      const price = parseFloat(itemPrice.value) || 0;
      // 販売手数料を計算（10%）
      const fee =  Math.floor(price * 0.1);
      // 販売手数料を表示
      addTaxPrice.innerHTML = `${fee}`;
      // 販売利益を計算
      const salesProfit = Math.floor(price - fee);
      // 販売利益を表示
      profit.innerHTML = `${salesProfit}`;
    });
  }
});