abstract class BaseMapper<M, D> {
  M toModel(D data);
  D toData(M model);
}
