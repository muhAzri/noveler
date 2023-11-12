import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/data/models/chapter/chapter_model.dart';
import 'package:noveler/feature/app/bloc/credit/credit_cubit.dart';
import 'package:noveler/feature/app/bloc/readed_chapter_cubit/readed_chapter_cubit.dart';
import 'package:noveler/feature/chapter/bloc/bloc/chapter_bloc.dart';
import 'package:noveler/feature/chapter/presentation/widgets/app_bar.dart';
import 'package:noveler/feature/novel/presentation/widgets/row_section_widget.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:noveler/utils/flushbar_util.dart';
import 'package:noveler/utils/string_utils.dart';
import 'package:noveler/utils/styles.dart';
import 'package:noveler/utils/unity_ads.dart';

class ChapterListScreen extends StatelessWidget {
  final String title;

  const ChapterListScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final ReadedChapterCubit cubit = context.watch<ReadedChapterCubit>();
    final CreditCubit creditCubit = context.watch<CreditCubit>();
    return Scaffold(
      appBar: ChapterListAppBar(
        title: title,
      ),
      body: SafeArea(
        child: BlocConsumer<ChapterBloc, ChapterState>(
          listener: (context, state) {
            if (state is ChapterFailed) {
              showCustomSnackbar(
                context: context,
                message: state.error,
                color: redColor,
              );
            }
          },
          builder: (context, state) {
            if (state is ChapterListSucces) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                itemCount: state.chapters.length,
                itemBuilder: (context, index) {
                  return ChapterItem(
                    model: state.chapters[index],
                    cubit: cubit,
                    creditCubit: creditCubit,
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class ChapterItem extends StatelessWidget {
  final Chapter model;
  final ReadedChapterCubit cubit;
  final CreditCubit creditCubit;
  const ChapterItem({
    super.key,
    required this.model,
    required this.cubit,
    required this.creditCubit,
  });

  void onClick(BuildContext context) async {
    if (!cubit.isIdAlreadyAdded(model.id)) {
      cubit.addIDtoCubit(model.id);
    }

    if (creditCubit.getCredit() > 0) {
      creditCubit.decreaseCredit();
      navigate(context);
    } else {
      UnityAdsUtils.loadAds(() {
        UnityAdsUtils.showAds(() {
          creditCubit.addCredit();
          navigate(context);
        });
      });
    }
  }

  void navigate(BuildContext context) async {
    Navigator.pushNamed(context, AppRoutes.chapterDetail,
        arguments: {"chapterID": model.id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(context);
      },
      child: Opacity(
        opacity: cubit.isIdAlreadyAdded(model.id) ? 0.5 : 1,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4.h),
          child: Column(
            children: [
              RowSectionWidget(
                title: model.title.capitalize(),
                value: DateTime.parse(model.createdAt).localDateParse(),
              ),
              SizedBox(
                height: 2.h,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
