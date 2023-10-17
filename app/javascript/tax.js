document.addEventListener('DOMContentLoaded', function() {
  function tax() {
    const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener("input", () => {
      // 入力された価格を数値に変換
      const price = parseFloat(itemPrice.value) || 0;
      // 販売手数料を計算（10%）
      const fee =  Math.floor(price * 0.1);
      // 販売手数料を表示
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = `${fee}`;
      // 販売利益を計算
      const salesProfit = price - fee;
      // 販売利益を表示
      const profit = document.getElementById("profit");
      profit.innerHTML = `${salesProfit}`;
    });
  }

  tax(); // tax 関数を実行
});