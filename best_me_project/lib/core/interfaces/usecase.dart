import 'package:fpdart/fpdart.dart';

abstract class UseCase<Type, Params> {
  // Future<Type> call({Params params});
  // Có thể thành công không trả về String mà sẽ trả về một kiểu dữ liệu khác => Type
  // Params là kiểu dữ liệu đầu vào của hàm call
  // Nếu không có tham số đầu vào thì sẽ tạo một class NoParams
  Future<Either<String, Type>> call({Params params});
}
