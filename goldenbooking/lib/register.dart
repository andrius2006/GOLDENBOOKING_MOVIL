import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
	const RegisterScreen({super.key});

	@override
	State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
	final _nameController = TextEditingController();
	final _emailController = TextEditingController();
	final _passwordController = TextEditingController();
	final _confirmPasswordController = TextEditingController();

	bool _isPasswordVisible = false;
	bool _isConfirmPasswordVisible = false;

	@override
	void dispose() {
		_nameController.dispose();
		_emailController.dispose();
		_passwordController.dispose();
		_confirmPasswordController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: const Color(0xFFF9F9F9),
			body: Center(
				child: SingleChildScrollView(
					padding: const EdgeInsets.symmetric(horizontal: 24),
					child: Container(
						constraints: const BoxConstraints(maxWidth: 480),
						padding: const EdgeInsets.all(40),
						decoration: BoxDecoration(
							color: Colors.white,
							borderRadius: BorderRadius.circular(16),
							boxShadow: [
								BoxShadow(
									color: Colors.black.withOpacity(0.05),
									blurRadius: 20,
									offset: const Offset(0, 10),
								),
							],
							border: Border.all(color: Colors.black.withOpacity(0.05)),
						),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							mainAxisSize: MainAxisSize.min,
							children: [
								const Center(
									child: Text(
										'Create Account',
										style: TextStyle(
											fontSize: 28,
											fontWeight: FontWeight.bold,
											color: Color(0xFF8B732A),
										),
									),
								),
								const SizedBox(height: 8),
								Center(
									child: Text(
										'Fill in your details to register.',
										textAlign: TextAlign.center,
										style: TextStyle(
											color: Colors.grey[600],
											fontSize: 14,
										),
									),
								),
								const SizedBox(height: 32),
								const Text(
									'Full Name',
									style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
								),
								const SizedBox(height: 8),
								TextField(
									controller: _nameController,
									decoration: InputDecoration(
										hintText: 'Your name',
										border: OutlineInputBorder(
											borderRadius: BorderRadius.circular(8),
											borderSide: BorderSide(color: Colors.grey[300]!),
										),
										enabledBorder: OutlineInputBorder(
											borderRadius: BorderRadius.circular(8),
											borderSide: BorderSide(color: Colors.grey[300]!),
										),
										contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
									),
								),
								const SizedBox(height: 24),
								const Text(
									'Email Address',
									style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
								),
								const SizedBox(height: 8),
								TextField(
									controller: _emailController,
									decoration: InputDecoration(
										hintText: 'name@example.com',
										suffixIcon: const Icon(Icons.email_outlined, size: 20),
										border: OutlineInputBorder(
											borderRadius: BorderRadius.circular(8),
											borderSide: BorderSide(color: Colors.grey[300]!),
										),
										enabledBorder: OutlineInputBorder(
											borderRadius: BorderRadius.circular(8),
											borderSide: BorderSide(color: Colors.grey[300]!),
										),
										contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
									),
								),
								const SizedBox(height: 24),
								const Text(
									'Password',
									style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
								),
								const SizedBox(height: 8),
								TextField(
									controller: _passwordController,
									obscureText: !_isPasswordVisible,
									decoration: InputDecoration(
										hintText: '••••••••',
										suffixIcon: IconButton(
											icon: Icon(
												_isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
												size: 20,
											),
											onPressed: () {
												setState(() {
													_isPasswordVisible = !_isPasswordVisible;
												});
											},
										),
										border: OutlineInputBorder(
											borderRadius: BorderRadius.circular(8),
											borderSide: BorderSide(color: Colors.grey[300]!),
										),
										enabledBorder: OutlineInputBorder(
											borderRadius: BorderRadius.circular(8),
											borderSide: BorderSide(color: Colors.grey[300]!),
										),
										contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
									),
								),
								const SizedBox(height: 24),
								const Text(
									'Confirm Password',
									style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
								),
								const SizedBox(height: 8),
								TextField(
									controller: _confirmPasswordController,
									obscureText: !_isConfirmPasswordVisible,
									decoration: InputDecoration(
										hintText: '••••••••',
										suffixIcon: IconButton(
											icon: Icon(
												_isConfirmPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
												size: 20,
											),
											onPressed: () {
												setState(() {
													_isConfirmPasswordVisible = !_isConfirmPasswordVisible;
												});
											},
										),
										border: OutlineInputBorder(
											borderRadius: BorderRadius.circular(8),
											borderSide: BorderSide(color: Colors.grey[300]!),
										),
										enabledBorder: OutlineInputBorder(
											borderRadius: BorderRadius.circular(8),
											borderSide: BorderSide(color: Colors.grey[300]!),
										),
										contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
									),
								),
								const SizedBox(height: 32),
								SizedBox(
									width: double.infinity,
									height: 50,
									child: ElevatedButton(
										onPressed: () {},
										style: ElevatedButton.styleFrom(
											backgroundColor: const Color(0xFFD4AF37),
											foregroundColor: Colors.white,
											elevation: 0,
											shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
										),
										child: const Text(
											'SIGN UP',
											style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
										),
									),
								),
								const SizedBox(height: 24),
								Center(
									child: TextButton(
										onPressed: () => Navigator.of(context).pop(),
										child: const Text(
											'Already have an account? Sign in',
											style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold),
										),
									),
								),
							],
						),
					),
				),
			),
		);
	}
}
