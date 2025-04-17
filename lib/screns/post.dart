import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:skin/services/loginApi.dart';

class DoctorPostsScreen extends StatefulWidget {
  const DoctorPostsScreen({super.key});

  @override
  State<DoctorPostsScreen> createState() => _DoctorPostsScreenState();
}

class _DoctorPostsScreenState extends State<DoctorPostsScreen> {
  final Dio _dio = Dio();
  List<dynamic> _posts = [];
  bool _isLoading = true;

  Future<void> _fetchDoctorPosts() async {
    String apiUrl = '$baseUrl/PostApi'; // Replace with your API

    try {
      final response = await _dio.get(apiUrl);
      print(response);
      if (response.statusCode == 200) {
        setState(() {
          _posts = response.data;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Error fetching posts: $e');
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Error loading posts')));
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchDoctorPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Posts"),
        backgroundColor: const Color.fromARGB(255, 8, 117, 206),
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _posts.isEmpty
              ? const Center(child: Text('No posts found'))
              : ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (post['postimage'] != null &&
                              post['postimage'].toString().isNotEmpty)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                baseUrl + post['postimage'],
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          const SizedBox(height: 8),
                          Text(
                            'Post Name: ${post['postname']}' ?? 'No name',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Description: ${post['postdescription']}' ??
                                'No desc',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
