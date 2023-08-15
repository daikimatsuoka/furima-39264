window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor( inputValue * 0.1 );

  const itemProfit = document.getElementById("profit");
  itemProfit.innerHTML = Math.floor( inputValue - parseFloat(addTaxDom.innerHTML));
  });
});