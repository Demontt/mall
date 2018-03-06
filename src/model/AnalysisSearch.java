package model;

import java.util.HashSet;
import java.util.Iterator;

public class AnalysisSearch {
    private String search;
    private HashSet<String> results;

    public AnalysisSearch(String search) {
        this.search = search;
        results = new HashSet<>();
    }

    public void addResult(String result) {
        results.add(result);
    }

    public Iterator getResults() {
        return results.iterator();
    }

    public boolean isEmpty() {
        return results.size() == 0;
    }

    public String getSearch() {
        return search;
    }
}
