package com.sf.hackthon.pre.hackthonday;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.PriorityQueue;
import java.util.regex.Pattern;

/**
 * 计算给定的字符串最多的几个字符并返回出现次数
 *
 * @author YANGLiiN 2017-12-05 14:21
 */
public class TopK {


  /**
   * 汉字正则表达式
   */
  private static final Pattern CHINESE_PATTERN = Pattern.compile("[\\u4e00-\\u9fa5]");
  /**
   * 汉字一共就7000来个
   */
  private static final int CHINESE_MAX_CAPACITY = 7000;
  /**
   * 输入buf大小
   */
  private static final int IPUT_BUFFER_SIZE = 10240;
  /**
   * 要计算的最大个数
   */
  private static final int TOP_K = 10;

  /**
   * 测试文件路径
   */
  private static final String TEST_FILE_PATH = "E:/题目.txt";

  public static void main(String[] args) throws Exception {

    // 1.读取文件获取输入
    String input = readFileToString(TEST_FILE_PATH);

    // 2.计算topK
    List<Entry<Character, Integer>> rs = computerTopKChar(input, TOP_K);

    // 3.打印结果
    for (Map.Entry<Character, Integer> e : rs) {
      System.out.println(e.getKey() + "," + e.getValue());
    }
  }

  /**
   * 读取文件 以字符串方式返回文件中的内容
   *
   * @param file 文件路径
   * @return 字符串方式返回文件的内容
   */
  public static final String readFileToString(String file) throws IOException {

    StringWriter sw = new StringWriter();
    char[] buffer = new char[IPUT_BUFFER_SIZE];

    try (InputStreamReader reader = new InputStreamReader(new FileInputStream(file))) {
      int idx;
      while (-1 != (idx = reader.read(buffer))) {
        sw.write(buffer, 0, idx);
      }
    } catch (IOException e) {
      throw e;
    }

    return sw.toString();

  }

  /**
   * 计算给定的字符串最多的几个字符并返回出现次数
   *
   * @param input 要计算的字符串
   * @param k 多少个
   */
  public static final List<Entry<Character, Integer>> computerTopKChar(String input, int k) {

    Map<Character, Integer> map = new HashMap<>(CHINESE_MAX_CAPACITY);
    for (int i = 0; i < input.length(); i++) {
      Character c = input.charAt(i);
      // 汉字
      if (CHINESE_PATTERN.matcher(c.toString()).matches()) {
        map.put(c, map.containsKey(c) ? map.get(c) + 1 : 1);
      }

    }

    // 优先级队列
    PriorityQueue<Entry<Character, Integer>> pqueue = new PriorityQueue<>(
        (o1, o2) -> o2.getValue() - o1.getValue());
    pqueue.addAll(map.entrySet());

    Map<Character, Integer> rs = new HashMap<>();
    for (int i = 0; i < k; i++) {
      Entry<Character, Integer> e = pqueue.poll();
      rs.put(e.getKey(), e.getValue());
    }

    List<Entry<Character, Integer>> list = new ArrayList<>(rs.entrySet());
    Collections.sort(list, Comparator.comparing(Entry::getValue));

    return list;
  }


}
