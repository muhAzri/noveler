import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:noveler/feature/app/bloc/credit/credit_cubit.dart';
import 'package:noveler/feature/app/bloc/readed_chapter_cubit/readed_chapter_cubit.dart';
import 'package:noveler/feature/chapter/bloc/bloc/chapter_bloc.dart';
import 'package:noveler/feature/chapter/presentation/widgets/chapter_detail_modal.dart';
import 'package:noveler/feature/chapter/presentation/widgets/font_size_button.dart';
import 'package:noveler/utils/flushbar_util.dart';
import 'package:noveler/utils/read_settings.dart';
import 'package:noveler/utils/string_utils.dart';
import 'package:noveler/utils/styles.dart';

class ChapterDetailScreen extends StatefulWidget {
  final String chapterID;
  const ChapterDetailScreen({super.key, required this.chapterID});

  @override
  State<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}

class _ChapterDetailScreenState extends State<ChapterDetailScreen> {
  late double fontSize = 14;
  late bool isBold = false;

  @override
  void initState() {
    getReadSettings();
    super.initState();
  }

  Future<void> getReadSettings() async {
    double savedFontSize = await ReadSettings.getFontSize();
    bool savedIsBold = await ReadSettings.getIsBold();

    setState(() {
      fontSize = savedFontSize;
      isBold = savedIsBold;
    });
  }

  Widget fontOption() {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FontSizeButton(
            label: '-',
            onTap: () async {
              if (fontSize > 8) {
                setState(() {
                  fontSize = fontSize - 2;
                });
                await ReadSettings.setFontSize(fontSize - 2);
              }
            },
          ),
          Text(
            "Font Size: $fontSize",
            style: blackTextStyle.copyWith(
              fontWeight: bold,
            ),
          ),
          FontSizeButton(
            label: '+',
            onTap: () async {
              setState(() {
                fontSize = fontSize + 2;
              });
              await ReadSettings.setFontSize(fontSize + 2);
            },
          ),
          BoldButton(
            isActive: isBold,
            onTap: () async {
              setState(() {
                isBold = !isBold;
              });
              await ReadSettings.setIsBold(!isBold);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.h),
          child: fontOption(),
        ),
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
          if (state is ChapterDetailSucces) {
            String nowChapter = state.detail.title.capitalize();
            String? previousChapter = state.detail.previousChapter?.id;
            String? nextChapter = state.detail.nextChapter?.id;
            final readedCubit = context.watch<ReadedChapterCubit>();
            final creditCubit = context.watch<CreditCubit>();
            return BlocProvider(
              create: (context) => ChapterBloc()
                ..add(
                  GetChapterHTMLEvent(state.detail.content.hexUrlEncode),
                ),
              child: BlocBuilder<ChapterBloc, ChapterState>(
                builder: (context, state) {
                  if (state is ChapterHTMLSuccess) {
                    return SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: GestureDetector(
                          onTap: () {
                            chapterModal(
                              context: context,
                              nowChapter: nowChapter,
                              previousChapterID: previousChapter,
                              nextChapterID: nextChapter,
                              readedCubit: readedCubit,
                              creditCubit: creditCubit,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 60.h),
                            child: HtmlWidget(
                              state.html,
                              textStyle: blackTextStyle.copyWith(
                                fontWeight: isBold ? bold : medium,
                                fontSize: fontSize.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }
}
