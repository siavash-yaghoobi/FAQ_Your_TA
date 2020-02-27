const startDateInput = document.getElementById("booking_starts_at");
const endDateInput = document.getElementById("booking_ends_at");

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
    const price = diffDay * 50;

    console.log('im here')
    console.log(price)
    document.getElementById("price").innerText = `The price is ${price} Dollar`;
}

startDateInput.addEventListener('change', calculatePrice);
endDateInput.addEventListener('change', calculatePrice);
