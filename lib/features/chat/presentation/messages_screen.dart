import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../data/datasources/local/chat_local_datasource.dart';
import '../domain/entities/contact_entity.dart';
import 'bloc/chat_bloc.dart';
import 'bloc/chat_event.dart';
import 'bloc/chat_state.dart';
import 'local_widgets/chat_bubble_in.dart';
import 'local_widgets/chat_bubble_out.dart';
import 'local_widgets/chat_input_bar.dart';
import 'local_widgets/chat_profile_header.dart';

class MessagesScreen extends StatelessWidget {
  final ContactEntity contact;

  const MessagesScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(
        initialMessages: ChatLocalDataSource().getMessages(contact.id),
      ),
      child: _MessagesScreenBody(contact: contact),
    );
  }
}

class _MessagesScreenBody extends StatefulWidget {
  final ContactEntity contact;

  const _MessagesScreenBody({required this.contact});

  @override
  State<_MessagesScreenBody> createState() => _MessagesScreenBodyState();
}

class _MessagesScreenBodyState extends State<_MessagesScreenBody> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage(BuildContext context) {
    context.read<ChatBloc>().add(ChatMessageSent(_messageController.text));
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.chevron_left,
            size: 24,
            color: AppColors.neutral900,
          ),
        ),
      ),
      bottomNavigationBar: ChatInputBar(
        controller: _messageController,
        onSend: () => _sendMessage(context),
      ),
      body: Column(
        children: [
          ChatProfileHeader(
            contact: widget.contact,
            onCallTap: () => context.push(AppRoutes.sessionRequest),
            onVideoTap: () => context.push(AppRoutes.videoCall),
          ),
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return ListView.separated(
                  padding: const EdgeInsets.all(24),
                  itemCount: state.messages.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    return message.isOutgoing
                        ? ChatBubbleOut(text: message.text, time: message.time)
                        : ChatBubbleIn(text: message.text, time: message.time);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
