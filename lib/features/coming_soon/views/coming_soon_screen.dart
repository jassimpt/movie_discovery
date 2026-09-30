import 'package:flutter/material.dart';
import 'package:movie_discovery/features/coming_soon/controller/coming_soon_controller.dart';
import 'package:movie_discovery/features/coming_soon/views/widgets/coming_soon_card.dart';
import 'package:movie_discovery/features/coming_soon/views/widgets/notification_top_section.dart';
import 'package:provider/provider.dart';

class ComingSoonScreen extends StatefulWidget {
  const ComingSoonScreen({super.key});

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ComingSoonController>().getUpcomingMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NotificationTopSection(),
            Expanded(
              child: Consumer<ComingSoonController>(
                builder: (context, ctrl, _) {
                  if (ctrl.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  }

                  if (ctrl.upcomingMovies.isEmpty) {
                    return const Center(
                      child: Text(
                        'Nothing coming soon',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: ctrl.upcomingMovies.length,
                    itemBuilder: (context, index) {
                      return ComingSoonCard(movie: ctrl.upcomingMovies[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
