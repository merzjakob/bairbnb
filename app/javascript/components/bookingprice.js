
const insertTotalPrice = (value) => {
  const totalPrice = document.getElementById("total_price")
  totalPrice.innerText = `Total price of your stay: ${value} €`
};

const calculateTotalPrice = () => {
  const form = document.querySelector('#new_booking');

  if (!form) {
    return;
  }

  form.addEventListener("change", event => {
    const startElement = document.querySelector('#booking_start_date')
    const endElement = document.querySelector('#booking_end_date')

    let startDate = Date.parse(startElement.value)/ 86400
    let endDate = Date.parse(endElement.value)/ 86400
    const diffDays = Math.round(Math.abs((startDate - endDate)/1000));
    const price = parseInt(document.querySelector("#price_per_night").innerText, 10);
    // const time = Date.parse(endDate -startDate);
    const value = diffDays * price;
    insertTotalPrice(value);
  })
};

export { calculateTotalPrice, insertTotalPrice };
