const form = document.querySelector('form')

form.addEventListener("change", event => {
  const startDate = form.querySelector('#booking_start_date')
  const endDate = form.querySelector('#booking_end_date')
if (startDate.value !== "" && endDate.value !== "")
  calculateTotalPrice(startDate, endDate);
})

const calculateTotalPrice = (start, end) => {
  const startDate = Date.parse(start.value)/ 86400
  const endDate = Date.parse(end.value)/ 86400
  const diffDays = Math.round(Math.abs((startDate - endDate)/1000));
  const price = parseInt(document.querySelector("#price_per_night").innerText, 10);
  // const time = Date.parse(endDate -startDate);
  const value = diffDays * price;
  insertTotalPrice(value);
  console.log(startDate)
};

const insertTotalPrice = (value) => {
const totalPrice = document.getElementById("total_price")
totalPrice.innerText = `Total price of your stay: ${value} €`
};

export { calculateTotalPrice, insertTotalPrice };
