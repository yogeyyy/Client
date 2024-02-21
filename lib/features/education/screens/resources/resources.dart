import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:solution_challenge/common/widgets/education/articles/home_article_column.dart';
import 'package:solution_challenge/common/widgets/education/videos/VideoBuilder.dart';
import 'package:solution_challenge/common/widgets/education/videos/video_card.dart';
import 'package:solution_challenge/common/widgets/ngo/progress_bar.dart';
import 'package:solution_challenge/features/education/screens/course_screen.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/features/education/screens/resources/widgets/education_appbar.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/education/articles/article_column_display.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../common/widgets/viewall/viewall_cards.dart';
import '../../../../models/user.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// AppBar
            const PEducationAppbar(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            ///SearchBar
            const PSearchContainer(
              text: "Search Resources",
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            ///Body
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Quiz Question
                  GestureDetector(
                    onTap: () => Get.to(() => const CourseScreen()),
                    child: PRoundedContainer(
                      radius: 40,
                      width: PHelperFunctions.screenWidth(),
                      height: 330,
                      backgroundColor: TColors.brightpink,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: TSizes.xl, left: TSizes.xl, top: TSizes.xl),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage(TImages.courseThumbnail),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems,
                            ),
                            Text(
                              translatedStrings?[40] ?? 'Beginners guide to menstrual health',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .apply(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems,
                            ),
                            const PProgressBar(
                              progressValue: 0.4,
                              backgroundColor: TColors.accent,
                              progressColor: TColors.rani,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '40% Completed',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(color: Colors.white),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      translatedStrings?[32] ?? 'Continue',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .apply(color: Colors.white),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///Featured videos
                  PSectionHeading(
                    title: translatedStrings?[41] ?? 'Featured Videos',
                    textColor: dark ? Colors.white : Colors.black,
                    onPressed: () => Get.to(() => const PViewAllScreen(
                      initiativeType: 'Videos',
                    )),
                  ),
                  const SizedBox(
                    height: 250,
                    child: VideoBuilder(),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///Latest Articles
                  PSectionHeading(
                    title: translatedStrings?[42] ?? 'Latest Articles',
                    textColor: dark ? Colors.white : Colors.black,
                    onPressed: () => Get.to(() => const PViewAllScreen(
                      initiativeType: 'Articles',
                    )),
                  ),
                  const SizedBox(
                    height: 365,
                    child: ArticleColumnBuilder(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}