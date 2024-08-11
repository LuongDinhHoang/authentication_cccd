import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:two_id_c06verify/shares/widgets/text/font_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/core.src.dart';
import '../terms_policies.src.dart';

class TermsAndPoliciesPage extends StatelessWidget {
  const TermsAndPoliciesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackgroundAppBar.buildAppBar("Bảo vệ dữ liệu cá nhân"),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildTextBlock(
        text: "Điều khoản xác nhận bảo vệ dữ liệu cá nhân:",
        style: StyleEnum.subBold,
      ),
      _buildBulletItem(
        "Cung cấp và cho phép Nhà cung cấp lưu trữ, sử dụng các thông tin, tài liệu, dữ liệu của mình để thực hiện hoạt động cung cấp dịch vụ Chứng thực chữ ký số.",
      ),
      _buildBulletItem(
        "Cam kết các thông tin, tài liệu, dữ liệu cung cấp là đúng sự thật và chịu hoàn toàn trách nhiệm đối với các thông tin cung cấp này.",
      ),
      _buildBulletItem(
        "",
        customText: RichText(
          maxLines: 10,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Tuân thủ các điều khoản trong ",
                style: FontStyleUtils.fontStyleSans(),
              ),
              TextSpan(
                text: "Chính sách Bảo mật ",
                style: FontStyleUtils.fontStyleSans(
                  color: AppColors.primaryBlue1,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(() => const PrivacyPolicyPage());
                  },
              ),
              TextSpan(
                text:
                    "thông tin của Nhà cung cấp trong quá trình sử dụng dịch vụ",
                style: FontStyleUtils.fontStyleSans(),
              )
            ],
          ),
        ),
      ),
      buildTextBlock(
        text:
            "Bằng việc xác nhận này, tôi đã đọc, hiểu và đồng ý với những nội dung trong điều khoản xác nhận sử dụng của Nhà cung cấp.",
        style: StyleEnum.subBold,
      ),
    ],
  ).paddingSymmetric(horizontal: AppDimens.padding10);
}

Widget _buildBulletItem(String text, {RichText? customText}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const TextUtils(text: "\u2022").paddingSymmetric(
        horizontal: AppDimens.padding3,
      ),
      Expanded(
        child: customText ??
            TextUtils(
              text: text,
              maxLine: 10,
            ),
      ),
    ],
  );
}
