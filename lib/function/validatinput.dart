vlidateinput(value) {
  if (value!.isEmpty) {
    return 'required filde';
  }
}










// validInput(String value, int max, int min, String type, {String? combering}) {
//   if (type == 'password') {
//     RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
//     regEx.hasMatch(value).hashCode;
//     if (value.isEmpty || !(regEx.hasMatch(value))) {
//       return 'password must contain at least 8 characters\n including upper/lowercase and numbers';
//     }
//     if (value.length < min) {
//       return '${'should be greater than'}$min';
//     }
//     if (value.length > max) {
//       return '${'should be less than'}$max';
//     }
//   }
//   if (type == 'confirmpassword_singup') {
//     if (value!.isEmpty) {
//       return 'password must contain at least 8 characters\n including upper/lowercase and numbers';
//     }
//     if (value != combering) {
//       return 'Passwords do NOT match!';
//     }
//   }
//   if (type == 'confirmpassword_resat') {
//     if (value!.isEmpty) {
//       return 'password must contain at least 8 characters\n including upper/lowercase and numbers';
//     }
//     if (value != combering) {
//       return 'Passwords do NOT match!';
//     }
//   }
//   // if (value!.length > max) {
//   //   return '${'should be less than'}$max';
//   // }
//   // if (value.length < min) {
//   //   return '${'should be greater than'}$min';
//   // }
//   if (type == 'age') {
//     if (value!.isEmpty) {
//       return 'Enter your age';
//     }
//     if (int.parse(value) <= min || int.parse(value) >= max) {
//       return 'rong  value';
//     }
//   }
// }
