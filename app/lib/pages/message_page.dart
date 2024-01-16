import 'package:little_pet_home/index.dart';

class MessagePage extends HookWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    final tabModel = TabModel(
      tabs: [
        const Tab(
          icon: Icon(Icons.question_answer_rounded),
          text: '私信',
        ),
        const Tab(
          icon: Icon(Icons.chat_rounded),
          text: '评论',
        ),
        const Tab(
          icon: Icon(Icons.thumb_up_rounded),
          text: '点赞',
        ),
        const Tab(
          icon: Icon(Icons.spatial_audio_rounded),
          text: '系统',
        ),
      ],
      views: [
        _MessageListView(controller: controller),
        _MessageListView(controller: controller),
        _MessageListView(controller: controller),
        _MessageListView(controller: controller),
      ],
    );

    return DefaultTabController(
      length: tabModel.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('消息'),
          actions: [
            const _CleanButton(),
            _BackToTopButton(
              controller: controller,
            ),
          ],
          bottom: TabBar(tabs: tabModel.tabs),
        ),
        body: TabBarView(children: tabModel.views),
      ),
    );
  }
}

class _MessageListView extends StatelessWidget {
  const _MessageListView({
    super.key,
    required this.controller,
  });

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) => BasedListTile(
        leading: BasedAvatar(
          placeholder: Text('$index'),
        ),
        titleText: '$index',
        subtitleText: '${index.hashCode}',
        trailing: Text(
          DateTime.fromMillisecondsSinceEpoch(
            1145141919810,
          ).timeago(
            locale: Localizations.localeOf(context).toString(),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}

class _BackToTopButton extends StatelessWidget {
  const _BackToTopButton({required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => controller.animateTo(
        -WindowAppBar.appBarHeight,
        duration: Durations.extralong4,
        curve: Curves.easeInOut,
      ),
      icon: const Icon(Icons.rocket_rounded),
    );
  }
}

class _CleanButton extends StatelessWidget {
  const _CleanButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.cleaning_services_rounded),
    );
  }
}
