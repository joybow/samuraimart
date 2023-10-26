function handleImage(image) {
    let reader = new FileReader();
    reader.onload = function() {
        let imagePreview = document.getElementById("product-image-preview");
        imagePreview.src = reader.resuclt;
        imagePreview.className += "img-fluid w-25";
    };
console.log(image);
reader.readAsDataURL(image[0]);
}