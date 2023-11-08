import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/data/models/novel/novel_model.dart';
import 'package:noveler/feature/bookmark/bloc/bloc/bookmark_bloc.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:noveler/utils/styles.dart';

class BookmarkGridTile extends StatelessWidget {
  final NovelModel novel;

  const BookmarkGridTile({super.key, required this.novel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.novelDetail,
            arguments: {"novelID": novel.id});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: blackColor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 120.h,
              child: Stack(
                children: [
                  _ImageContainer(novel.coverImage),
                  _PopUpButton(novel.id),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 4.h,
              ),
              child: Text(
                novel.title,
                style:
                    blackTextStyle.copyWith(fontWeight: bold, fontSize: 12.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PopUpButton extends StatelessWidget {
  final String novelID;
  const _PopUpButton(this.novelID);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: 40.h,
        width: 40.w,
        margin: EdgeInsets.only(
          left: 80.w,
        ),
        child: PopupMenuButton(
          color: blackColor,
          icon: Icon(
            Icons.more_vert,
            size: 24.sp,
            color: whiteColor,
          ),
          onSelected: (value) async {
            if (value == 1) {
              Navigator.pushNamed(context, AppRoutes.novelDetail,
                  arguments: {"novelID": novelID});
            }

            if (value == 2) {
              context
                  .read<BookmarkBloc>()
                  .add(AddOrRemoveBookmarkEvent(novelID, inBookmark: true));
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: 1,
                child: Text(
                  'See Details',
                  style: whiteTextStyle,
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Text(
                  'Remove From Bookmarks',
                  style: whiteTextStyle,
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}

class _ImageContainer extends StatelessWidget {
  final String novelImage;
  const _ImageContainer(this.novelImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
        image: DecorationImage(
          image: NetworkImage(
            novelImage,
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            blackColor.withOpacity(0.5),
            BlendMode.srcOver,
          ),
        ),
      ),
    );
  }
}
