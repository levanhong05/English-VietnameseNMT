#pragma once

#include <string>
#include <unordered_map>
#include <vector>

namespace onmt
{

  class BPE
  {
  public:
    BPE(const std::string& model_path);

    std::vector<std::string> encode(const std::string& str) const;

  private:
    static const std::string end_of_word;

    struct pair_hash {
    public:
      template <typename T, typename U>
      std::size_t operator()(const std::pair<T, U> &x) const
      {
        return std::hash<T>()(x.first) ^ std::hash<U>()(x.second);
      }
    };

    std::unordered_map<std::pair<std::string, std::string>, int, pair_hash> _codes;

    std::pair<std::string, std::string>
    get_min_pair(const std::vector<std::pair<std::string, std::string> >& pairs) const;

  };

}
