document.addEventListener('DOMContentLoaded', function() {
    fetch('process-progress-circle.php', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    })
    .then(response => response.json())
    .then(data => {

        var topicCount = data.topicCount;
        var doneCount = data.doneCount;

        var percentage = Math.round((doneCount*100)/topicCount);
        var circle = document.querySelector(".circle");
        var value = document.querySelector(".value");
        var startValue = 0;
        var finalValue = 100;
        var animation = false;

        var interval = setInterval (() => {
            if (!animation) {
                startValue++;
                value.textContent = startValue + "%";
                circle.style.background = "conic-gradient(#9ec5fe "+ startValue * 3.6 +"deg, #ffffff 0deg)";

                if (startValue === finalValue) {
                    animation = true;
                }
            } else {
                startValue--;
                value.textContent = startValue + "%";
                circle.style.background = "conic-gradient(#9ec5fe "+ startValue * 3.6 +"deg, #ffffff 0deg)";

                if (startValue === percentage) {
                    clearInterval(interval);
                }
            }
        }, 20);

        // Progress circle for each category
        for (let i = 1; i <= data.categoryCount; i++) {
            let categoryPercentage = Math.round((data.categoryDoneCount[i] * 100) / data.categoryTopicCount[i]);
            let categoryCircle = document.querySelector(`.category-circle[data-category-id="${i}"]`);
            categoryCircle.style.background = "conic-gradient(#9ec5fe "+ categoryPercentage * 3.6 +"deg, #ffffff 0deg)";
        }
    });
});

