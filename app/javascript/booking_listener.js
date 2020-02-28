const startDateInput = document.getElementById("range_start");
const endDateInput = document.getElementById("range_end");
const duckPrice = '<%= @duck.price %>'

// console.log(startDateInput)

function calculatePrice() {
    // if any of the boxes are empty
    if (!startDateInput.value || !endDateInput.value) {
        return;
    }

    const startDate = new Date(startDateInput.value);
    const endDate = new Date(endDateInput.value);
    const diffTime = endDate - startDate;
    const diffDay = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;
    const price = diffDay * duckPrice;

    console.log('im here')
    console.log(price)
    document.getElementById("price").innerText = `The price is ${price} Dollar`;
}

if (startDateInput) {
startDateInput.addEventListener('change', calculatePrice);
};
if (endDateInput) {
endDateInput.addEventListener('change', calculatePrice);
};
