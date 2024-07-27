import 'package:flutter/material.dart';

import '../../../core/core.src.dart';
import '../../../shares/shares.src.dart';
import '../terms_policies.src.dart';


class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackgroundAppBar.buildAppBar("Chính sách sử dụng dịch vụ"),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextBlock(
          text: "Chính sách sử dụng dịch vụ chứng thực chữ ký số EasyCA",
          style: StyleEnum.subBold,
        ),
        buildTextBlock(
          text:
              "Đây là điều khoản sử dụng dịch vụ giữa Khách hàng với Công ty cổ phần Đầu tư Công nghệ và Thương mại Softdreams, quy định các điều khoản trong việc Khách hàng sử dụng dịch vụ Chứng thực Chữ ký số công cộng EasyCA.",
        ),
        buildTextBlock(
          text: "Điều 1: Giải thích từ ngữ",
          style: StyleEnum.bodyBold,
        ),
        buildTextBlock(
          text:
              "1.1 Dịch vụ hoặc EasyCA: Là dịch vụ Chứng thực Chữ ký số công cộng EasyCA do Công ty cổ phần đầu từ Công nghệ và Thương mại Softdreams cung cấp theo giấy phép cung cấp do Bộ Thông tin và Truyền thông cấp.",
        ),
        buildTextBlock(
          text:
              "1.2. Khách hàng hoặc Thuê bao: Là cá nhân và/ hoặc tổ chức đăng ký sử dụng dịch vụ EasyCA.",
        ),
        buildTextBlock(
          text:
              "1.3. Công ty Softdreams hoặc EasyCA: Là đơn vị được Bộ Thông tin và Truyền thông cấp giấy phép cung cấp dịch vụ chứng thực chữ ký số EasyCA.",
        ),
        buildTextBlock(
          text:
              "1.4. Chính sách sử dụng dịch vụ: Là những điều khoản được quy định tại văn bản này, kèm theo Phiếu đăng ký cấp chứng thư số EasyCA và Hợp đồng cung cấp dịch vụ tạo nên các thỏa thuận về việc cung cấp và sử dụng dịch vụ Chứng thực Chữ ký số công cộng EasyCA",
        ),
        buildTextBlock(
          text:
              "1.5. Phiếu đăng ký cấp chứng thư số EasyCA: Là văn bản đề nghị cung cấp dịch vụ được ký kết giữ khách hàng và EasyCA theo mẫu EasyCA ban hành.",
        ),
        buildTextBlock(
          text:
              "1.6.  Khóa: Là một chuỗi các số nhị phân (0 và 1) dùng trong các hệ thống mật mã.",
        ),
        buildTextBlock(
          text:
              "1.7.  Khóa bí mật: Là một khóa trong cặp khóa thuộc hệ thống mật mã không đối xứng, được dùng để tạo chữ ký số.",
        ),
        buildTextBlock(
          text:
              "1.8.  Khóa công khai: Là một khóa trong cặp khóa thuộc hệ thống mật mã không đối xứng, được sử dụng để kiểm tra chữ ký số được tạo bởi khóa bí mật tương ứng trong cặp khóa.",
        ),
      ],
    ).paddingAll(AppDimens.padding10),
  );
}
