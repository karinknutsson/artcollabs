const toggleVisibility = (entity) => {
    const element = document.getElementById(entity);
    if (element.style.display === "none") {
        element.style.display = "block";
    } else {
        element.style.display = "none";
    }
}
