let date = document.querySelectorAll('.time');
let endDate = document.querySelectorAll('.remaining');

// Update the count down every 1 second
let x = setInterval(function() {
    for (let i =0; i < endDate.length; i++) {
        // Set the date we're counting down to
        let countDownDate = new Date(date[i].childNodes[0].nodeValue).getTime();

        // Get today's date and time
        let now = new Date().getTime();

        // Find the distance between now and the count down date
        let distance = countDownDate - now;

        // Time calculations for days, hours, minutes and seconds
        let days = Math.floor(distance / (1000 * 60 * 60 * 24));
        let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        let seconds = Math.floor((distance % (1000 * 60)) / 1000);

        if (days > 3) {
            // Output the result in an element with id="demo"
            endDate[i].innerHTML = `${days}d ${hours}h ${minutes}m ${seconds}s`;
        }
        else {
            if (days > 0) {
                endDate[i].innerHTML =`${days} ngày nữa`;
            }
            else {
                if (hours > 0){
                    endDate[i].innerHTML =`${hours} tiếng nữa`;
                }
                else {
                    if (minutes > 0){
                        endDate[i].innerHTML =`${minutes} phút nữa`;
                    }
                    else {
                        endDate[i].innerHTML =`${seconds} giây nữa`;
                    }
                }
            }
        }

        // If the count down is over, write some text
        if (distance < 0) {
            clearInterval(x);
            endDate[i].innerHTML = "Hết Thời Hạn";
        }
    }
}, 1000);
