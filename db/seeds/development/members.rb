names = %w[taro jiro hana john mike sophy bill alex mary tom]
fnames = %w[sato suzuki takahashi tanaka]
gnames = %w[taro jiro hanako]
0.upto(9) do |idx|
  Member.create(
    number: idx + 10,
    name: names[idx],
    full_name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
    email: "#{names[idx]}@example.com",
    birthday: '1981-12-01',
    sex: [1, 1, 2][idx % 3],
    admin: (idx == 0)
  )
end
